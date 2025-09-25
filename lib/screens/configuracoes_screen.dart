import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatelessWidget {
  const ConfiguracoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: Colors.grey[700],
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações do App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificações'),
              subtitle: Text('Gerenciar notificações do app'),
              trailing: Switch(
                value: true,
                onChanged: null,
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Tema Escuro'),
              subtitle: Text('Alternar entre tema claro e escuro'),
              trailing: Switch(
                value: false,
                onChanged: null,
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Idioma'),
              subtitle: Text('Português (Brasil)'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text('Armazenamento'),
              subtitle: Text('Gerenciar dados salvos'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}