import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/receita.dart';
import '../providers/receitas_provider.dart';

class AdicionarEditarReceitaScreen extends StatefulWidget {
  final Receita? receita; // null para adicionar, com dados para editar
  final String? categoriaInicial;

  const AdicionarEditarReceitaScreen({
    super.key,
    this.receita,
    this.categoriaInicial,
  });

  @override
  State<AdicionarEditarReceitaScreen> createState() => _AdicionarEditarReceitaScreenState();
}

class _AdicionarEditarReceitaScreenState extends State<AdicionarEditarReceitaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _ingredientesController = TextEditingController();
  final _modoPreparoController = TextEditingController();
  final _tempoController = TextEditingController();
  final _imagemController = TextEditingController();
  
  String _categoriaSelecionada = 'doces';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    
    if (widget.receita != null) {
      // Modo edição
      _tituloController.text = widget.receita!.titulo;
      _descricaoController.text = widget.receita!.descricao;
      _ingredientesController.text = widget.receita!.ingredientes.join('\n');
      _modoPreparoController.text = widget.receita!.modoPreparo;
      _tempoController.text = widget.receita!.tempoPreparo.toString();
      _imagemController.text = widget.receita!.imagemUrl;
      _categoriaSelecionada = widget.receita!.categoria;
    } else if (widget.categoriaInicial != null) {
      // Modo adicionar com categoria pré-selecionada
      _categoriaSelecionada = widget.categoriaInicial!;
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    _ingredientesController.dispose();
    _modoPreparoController.dispose();
    _tempoController.dispose();
    _imagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdicao = widget.receita != null;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdicao ? 'Editar Receita' : 'Nova Receita'),
        backgroundColor: _getColorForCategory(_categoriaSelecionada),
        foregroundColor: Colors.white,
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            )
          else
            TextButton(
              onPressed: _salvarReceita,
              child: const Text(
                'SALVAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categoria
              const Text(
                'Categoria',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _categoriaSelecionada,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: const [
                  DropdownMenuItem(value: 'doces', child: Text('🧁 Doces')),
                  DropdownMenuItem(value: 'salgadas', child: Text('🍝 Salgadas')),
                  DropdownMenuItem(value: 'bebidas', child: Text('🥤 Bebidas')),
                ],
                onChanged: (value) {
                  setState(() {
                    _categoriaSelecionada = value!;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Título
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(
                  labelText: 'Título da Receita',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Descrição
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Ingredientes
              TextFormField(
                controller: _ingredientesController,
                decoration: const InputDecoration(
                  labelText: 'Ingredientes (um por linha)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.list),
                  hintText: 'Ex:\n1 xícara de farinha\n2 ovos\n200ml de leite',
                ),
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, insira os ingredientes';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Modo de Preparo
              TextFormField(
                controller: _modoPreparoController,
                decoration: const InputDecoration(
                  labelText: 'Modo de Preparo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cookie),
                ),
                maxLines: 8,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, insira o modo de preparo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              // Imagem (caminho de asset local opcional)
              TextFormField(
                controller: _imagemController,
                decoration: const InputDecoration(
                  labelText: 'Caminho da imagem (assets) - opcional',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image),
                  hintText: 'assets/images/minha_foto.jpg',
                ),
                onChanged: (v) => setState(() {}),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return null;
                  // simples validação: se informado, deve começar com assets/
                  if (!value.trim().startsWith('assets/')) return 'Use um caminho dentro de assets/';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Preview da imagem (se for caminho assets)
              if (_imagemController.text.trim().isNotEmpty && _imagemController.text.trim().startsWith('assets/'))
                Container(
                  height: 160,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Image.asset(
                    _imagemController.text.trim(),
                    fit: BoxFit.cover,
                  ),
                ),
              // Tempo de Preparo
              TextFormField(
                controller: _tempoController,
                decoration: const InputDecoration(
                  labelText: 'Tempo de preparo (minutos)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.timer),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Por favor, insira o tempo de preparo';
                  final parsed = int.tryParse(value);
                  if (parsed == null || parsed <= 0) return 'Insira um número positivo';
                  return null;
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _salvarReceita() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    // Simular um delay para mostrar o loading
    final provider = Provider.of<ReceitasProvider>(context, listen: false);

    final ingredientes = _ingredientesController.text
        .split('\n')
        .where((ingredient) => ingredient.trim().isNotEmpty)
        .map((ingredient) => ingredient.trim())
        .toList();
    // small delay to show a loading indicator (non-blocking for context use)
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    if (widget.receita != null) {
      // Editar receita existente
      final receitaEditada = Receita(
        id: widget.receita!.id,
        titulo: _tituloController.text.trim(),
        descricao: _descricaoController.text.trim(),
        ingredientes: ingredientes,
        modoPreparo: _modoPreparoController.text.trim(),
        tempoPreparo: int.parse(_tempoController.text.trim()),
        categoria: _categoriaSelecionada,
        imagemUrl: _imagemController.text.trim().isNotEmpty ? _imagemController.text.trim() : widget.receita!.imagemUrl,
      );
      
      provider.editarReceita(widget.receita!.id, receitaEditada);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Receita editada com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Adicionar nova receita
      final hex = () {
        switch (_categoriaSelecionada) {
          case 'doces':
            return 'F06292';
          case 'salgadas':
            return 'FB8C00';
          case 'bebidas':
            return '42A5F5';
          default:
            return 'BDBDBD';
        }
      }();
      final novaReceita = Receita(
        id: provider.gerarProximoId(),
        titulo: _tituloController.text.trim(),
        descricao: _descricaoController.text.trim(),
        ingredientes: ingredientes,
        modoPreparo: _modoPreparoController.text.trim(),
        tempoPreparo: int.parse(_tempoController.text.trim()),
        categoria: _categoriaSelecionada,
        imagemUrl: _imagemController.text.trim().isNotEmpty
            ? _imagemController.text.trim()
            : 'https://via.placeholder.com/200x150/$hex/FFFFFF?text=${_tituloController.text.trim()}',
      );
      
      provider.adicionarReceita(novaReceita);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Receita adicionada com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  Color _getColorForCategory(String categoria) {
    switch (categoria) {
      case 'doces':
        return const Color(0xFFF06292); // pink[400]
      case 'salgadas':
        return const Color(0xFFFB8C00); // orange[400]
      case 'bebidas':
        return const Color(0xFF42A5F5); // blue[400]
      default:
        return const Color(0xFFBDBDBD); // grey[400]
    }
  }
}