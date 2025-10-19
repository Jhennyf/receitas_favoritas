import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/receitas.jpeg', fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(color: Color.fromRGBO(0, 0, 0, 0.35)),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 12,
                  color: Color.fromRGBO(255, 255, 255, 0.92),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Crie sua conta', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const Text('Cadastre-se para salvar e gerenciar suas receitas', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _nomeController,
                            decoration: const InputDecoration(labelText: 'Nome', prefixIcon: Icon(Icons.person), border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) return 'Nome é obrigatório';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(labelText: 'E-mail', prefixIcon: Icon(Icons.email), border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) return 'E-mail é obrigatório';
                              if (!RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$").hasMatch(value)) return 'E-mail inválido';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _senhaController,
                            decoration: const InputDecoration(labelText: 'Senha', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder()),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Senha é obrigatória';
                              if (value.length < 6) return 'Senha precisa ter ao menos 6 caracteres';
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            width: double.infinity,
                            child: _loading
                                ? const Center(child: CircularProgressIndicator())
                                : ElevatedButton(
                                    onPressed: _tentarCadastro,
                                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                    child: const Text('Cadastrar', style: TextStyle(fontSize: 16)),
                                  ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Voltar para login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tentarCadastro() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    // Capture provider before awaiting to avoid using context after async gap
    final auth = Provider.of<AuthProvider>(context, listen: false);

    await Future.delayed(const Duration(milliseconds: 400));

    final erro = auth.registrar(_nomeController.text.trim(), _emailController.text.trim(), _senhaController.text);

    if (!mounted) return;

    setState(() => _loading = false);

    if (erro != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(erro)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cadastro realizado com sucesso')));
      Navigator.of(context).pop(); // volta para a tela de login
    }
  }
}