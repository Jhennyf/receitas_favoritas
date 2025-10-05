import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/receita_card.dart';
import '../providers/receitas_provider.dart';
import 'configuracoes_screen.dart';
import 'sobre_screen.dart';
import 'adicionar_editar_receita_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  final List<String> _categorias = ['doces', 'salgadas', 'bebidas'];
  final List<String> _titulosCategorias = ['Doces', 'Salgadas', 'Bebidas'];
  final List<IconData> _iconsCategorias = [Icons.cake, Icons.restaurant, Icons.local_drink];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulosCategorias[_currentIndex]),
        backgroundColor: _getColorForCategory(_categorias[_currentIndex]),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    color: Colors.white,
                    size: 48,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Receitas Favoritas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Suas receitas, seus sabores',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConfiguracoesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SobreScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: _buildReceitasList(_categorias[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _getColorForCategory(_categorias[_currentIndex]),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_iconsCategorias[0]),
            label: _titulosCategorias[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(_iconsCategorias[1]),
            label: _titulosCategorias[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(_iconsCategorias[2]),
            label: _titulosCategorias[2],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarEditarReceitaScreen(
                categoriaInicial: _categorias[_currentIndex],
              ),
            ),
          );
        },
        backgroundColor: _getColorForCategory(_categorias[_currentIndex]),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildReceitasList(String categoria) {
    return Consumer<ReceitasProvider>(
      builder: (context, provider, child) {
        final receitas = provider.getReceitasPorCategoria(categoria);
        
        if (receitas.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getIconForCategory(categoria),
                  size: 64,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 16),
                Text(
                  'Nenhuma receita encontrada',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Toque no botão + para adicionar uma nova receita',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: receitas.length,
          itemBuilder: (context, index) {
            return ReceitaCard(receita: receitas[index]);
          },
        );
      },
    );
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
        return Colors.teal;
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