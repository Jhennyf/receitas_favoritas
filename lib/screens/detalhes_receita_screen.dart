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
            // Imagem representativa (cabeçalho) - manter o tamanho original anterior
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: receita.imagemUrl.startsWith('assets/')
                  ? Image.asset(
                      receita.imagemUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Icon(
                        _getIconForCategory(receita.categoria),
                        size: 80,
                        color: _getColorForCategory(receita.categoria),
                      ),
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
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.timer, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text('${receita.tempoPreparo} min', style: TextStyle(color: Colors.grey[600])),
              ],
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
            const SizedBox(height: 24),

            // Resultado Final - repetir imagem de capa com título
            const Text(
              'Resultado Final',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            // Resultado Final image - pequena thumbnail (300x300)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 300,
                height: 300,
                child: receita.imagemUrl.startsWith('assets/')
                    ? Image.asset(
                        receita.imagemUrl,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        receita.imagemUrl,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) => Container(
                          width: 300,
                          height: 300,
                          color: Colors.grey[300],
                          alignment: Alignment.center,
                          child: const Icon(Icons.broken_image, size: 32),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              receita.titulo,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
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
}