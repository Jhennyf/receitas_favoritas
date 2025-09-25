// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:receitas_favoritas/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ReceitasFavoritasApp());

    // Verify that our app loads with the title
    expect(find.text('Receitas Favoritas'), findsOneWidget);
    expect(find.text('Doces'), findsOneWidget);
    expect(find.text('Salgadas'), findsOneWidget);
    expect(find.text('Bebidas'), findsOneWidget);
  });
}
