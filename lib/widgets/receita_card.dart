import 'package:flutter/material.dart';
import '../models/receita.dart';
import '../screens/detalhes_receita_screen.dart';

class ReceitaCard extends StatelessWidget {
  final Receita receita;

  const ReceitaCard({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesReceitaScreen(receita: receita),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                color: Colors.grey[300],
              ),
              child: Icon(
                _getIconForCategory(receita.categoria),
                size: 60,
                color: _getColorForCategory(receita.categoria),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receita.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    receita.descricao,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
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
        return Colors.pink[300]!;
      case 'salgadas':
        return Colors.orange[300]!;
      case 'bebidas':
        return Colors.blue[300]!;
      default:
        return Colors.grey[300]!;
    }
  }
}