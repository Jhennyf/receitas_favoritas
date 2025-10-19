import 'package:flutter/material.dart';
import '../models/usuario.dart';

class AuthProvider extends ChangeNotifier {
  final List<Usuario> _usuarios = [];
  Usuario? _usuarioLogado;

  Usuario? get usuarioLogado => _usuarioLogado;

  bool get estaLogado => _usuarioLogado != null;

  String? registrar(String nome, String email, String senha) {
    // validações básicas
    if (nome.trim().isEmpty) return 'Nome é obrigatório.';
    if (!RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$").hasMatch(email)) return 'E-mail inválido.';
    if (senha.length < 6) return 'Senha precisa ter pelo menos 6 caracteres.';

    final existente = _usuarios.any((u) => u.email == email);
    if (existente) return 'E-mail já cadastrado.';

    final novo = Usuario(id: DateTime.now().millisecondsSinceEpoch.toString(), nome: nome.trim(), email: email.trim(), senha: senha);
    _usuarios.add(novo);
    notifyListeners();
    return null; // sem erro
  }

  String? login(String email, String senha) {
    final usuario = _usuarios.firstWhere((u) => u.email == email, orElse: () => Usuario(id: '', nome: '', email: '', senha: ''));
    if (usuario.id == '') return 'Usuário não encontrado.';
    if (usuario.senha != senha) return 'Senha incorreta.';

    _usuarioLogado = usuario;
    notifyListeners();
    return null;
  }

  void logout() {
    _usuarioLogado = null;
    notifyListeners();
  }
}