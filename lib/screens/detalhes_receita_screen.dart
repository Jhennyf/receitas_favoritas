import 'package:flutter/material.dart';
import '../models/receita.dart';

class DetalhesReceitaScreen extends StatelessWidget {
  final Receita receita;

  const DetalhesReceitaScreen({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita.titulo),
        backgroundColor: _getColorForCategory(receita.categoria),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem representativa
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: Icon(
                _getIconForCategory(receita.categoria),
                size: 80,
                color: _getColorForCategory(receita.categoria),
              ),
            ),
            const SizedBox(height: 20),
            
            // Título
            Text(
              receita.titulo,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            // Descrição
            Text(
              receita.descricao,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            
            // Ingredientes
            const Text(
              'Ingredientes:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            ...receita.ingredientes.map((ingrediente) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ingrediente,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 24),
            
            // Modo de Preparo
            const Text(
              'Modo de Preparo:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              receita.modoPreparo,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  IconData _getIconForCategory(String categoria) {
    switch (categoria) {
      case 'doces':
        return Icons.cake;
      case 'salgadas':
        return Icons.restaurant;
      case 'bebidas':
        return Icons.local_drink;
      default:
        return Icons.restaurant_menu;
    }
  }

  Color _getColorForCategory(String categoria) {
    switch (categoria) {
      case 'doces':
        return Colors.pink[400]!;
      case 'salgadas':
        return Colors.orange[400]!;
      case 'bebidas':
        return Colors.blue[400]!;
      default:
        return Colors.grey[400]!;
    }
  }
}