import 'package:flutter/material.dart';
import '../models/receita.dart';
import '../data/receitas_data.dart';

class ReceitasProvider extends ChangeNotifier {
  final List<Receita> _receitas = ReceitasData.receitas;

  List<Receita> get receitas => List.unmodifiable(_receitas);

  List<Receita> getReceitasPorCategoria(String categoria) {
    return _receitas.where((receita) => receita.categoria == categoria).toList();
  }

  Receita? getReceitaPorId(String id) {
    try {
      return _receitas.firstWhere((receita) => receita.id == id);
    } catch (e) {
      return null;
    }
  }

  void adicionarReceita(Receita receita) {
    _receitas.add(receita);
    notifyListeners();
  }

  void editarReceita(String id, Receita receitaEditada) {
    final index = _receitas.indexWhere((receita) => receita.id == id);
    if (index != -1) {
      _receitas[index] = receitaEditada;
      notifyListeners();
    }
  }

  void removerReceita(String id) {
    _receitas.removeWhere((receita) => receita.id == id);
    notifyListeners();
  }

  void restaurarReceita(Receita receita, int index) {
    _receitas.insert(index, receita);
    notifyListeners();
  }

  String gerarProximoId() {
    final ids = _receitas.map((r) => int.tryParse(r.id) ?? 0).toList();
    final maxId = ids.isEmpty ? 0 : ids.reduce((a, b) => a > b ? a : b);
    return (maxId + 1).toString();
  }
}