import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/receita.dart';
import '../screens/detalhes_receita_screen.dart';
import '../screens/adicionar_editar_receita_screen.dart';
import '../providers/receitas_provider.dart';

class ReceitaCard extends StatelessWidget {
  final Receita receita;

  const ReceitaCard({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(receita.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 32,
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirmar exclusão'),
            content: Text('Deseja realmente excluir "${receita.titulo}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Excluir'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        final provider = Provider.of<ReceitasProvider>(context, listen: false);
        final receitaRemovida = receita;
        final index = provider.receitas.indexOf(receita);
        
        provider.removerReceita(receita.id);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${receita.titulo} foi excluída'),
            action: SnackBarAction(
              label: 'Desfazer',
              onPressed: () {
                provider.restaurarReceita(receitaRemovida, index);
              },
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalhesReceitaScreen(receita: receita),
              ),
            );
          },
          onLongPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdicionarEditarReceitaScreen(receita: receita),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: receita.imagemUrl.startsWith('assets/')
                      ? Image.asset(
                          receita.imagemUrl,
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: () {
                            final hex = () {
                              switch (receita.categoria) {
                                case 'doces':
                                  return 0xFFF06292;
                                case 'salgadas':
                                  return 0xFFFB8C00;
                                case 'bebidas':
                                  return 0xFF42A5F5;
                                default:
                                  return 0xFFBDBDBD;
                              }
                            }();
                            return Color(((0.1 * 255).round() << 24) | (hex & 0x00FFFFFF));
                          }(),
                          child: Center(
                            child: Icon(
                              _getIconForCategory(receita.categoria),
                              size: 50,
                              color: _getColorForCategory(receita.categoria),
                            ),
                          ),
                        ),
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      receita.descricao,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: () {
                                  final hex = () {
                                    switch (receita.categoria) {
                                      case 'doces':
                                        return 0xFFF06292;
                                      case 'salgadas':
                                        return 0xFFFB8C00;
                                      case 'bebidas':
                                        return 0xFF42A5F5;
                                      default:
                                        return 0xFFBDBDBD;
                                    }
                                  }();
                                  return Color(((0.2 * 255).round() << 24) | (hex & 0x00FFFFFF));
                                }(),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _getCategoryDisplayName(receita.categoria),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: _getColorForCategory(receita.categoria),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                const Icon(Icons.timer, size: 14, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text(
                                  '${receita.tempoPreparo} min',
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalhesReceitaScreen(receita: receita),
                              ),
                            );
                          },
                          icon: const Icon(Icons.open_in_new),
                          label: const Text('Detalhes'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _getColorForCategory(receita.categoria),
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
        return const Color(0xFFF06292); // pink[400]
      case 'salgadas':
        return const Color(0xFFFB8C00); // orange[400]
      case 'bebidas':
        return const Color(0xFF42A5F5); // blue[400]
      default:
        return const Color(0xFFBDBDBD); // grey[400]
    }
  }

  String _getCategoryDisplayName(String categoria) {
    switch (categoria) {
      case 'doces':
        return 'Doces';
      case 'salgadas':
        return 'Salgadas';
      case 'bebidas':
        return 'Bebidas';
      default:
        return 'Outros';
    }
  }
}