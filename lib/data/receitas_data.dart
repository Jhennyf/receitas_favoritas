import '../models/receita.dart';

class ReceitasData {
  static List<Receita> receitas = [
    // Doces
    Receita(
      id: '1',
      titulo: 'Brigadeiro Gourmet',
      descricao: 'Delicioso brigadeiro cremoso com cobertura especial',
      ingredientes: [
        '1 lata de leite condensado',
        '3 colheres de sopa de chocolate em pó',
        '2 colheres de sopa de manteiga',
        'Chocolate granulado para decorar',
      ],
      modoPreparo: 'Em uma panela, misture o leite condensado, chocolate em pó e manteiga. Cozinhe em fogo médio, mexendo sempre, até desgrudar do fundo da panela. Deixe esfriar e faça bolinhas. Passe no chocolate granulado.',
      tempoPreparo: 30,
      categoria: 'doces',
      imagemUrl: 'assets/images/brigadeiro.jpg',
    ),
    Receita(
      id: '2',
      titulo: 'Pudim de Leite',
      descricao: 'Pudim cremoso com calda de açúcar caramelizada',
      ingredientes: [
        '1 lata de leite condensado',
        '2 latas de leite (use a lata do leite condensado)',
        '3 ovos',
        '1 xícara de açúcar para a calda',
      ],
      modoPreparo: 'Faça a calda derretendo o açúcar até caramelizar. Bata todos os outros ingredientes no liquidificador. Despeje sobre a calda e asse em banho-maria por 40 minutos.',
      tempoPreparo: 90,
      categoria: 'doces',
      imagemUrl: 'assets/images/pudim.jpg',
    ),
    Receita(
      id: '3',
      titulo: 'Mousse de Chocolate',
      descricao: 'Mousse aerado e cremoso de chocolate',
      ingredientes: [
        '200g de chocolate meio amargo',
        '3 gemas',
        '3 claras em neve',
        '3 colheres de açúcar',
      ],
      modoPreparo: 'Derreta o chocolate em banho-maria. Misture as gemas. Incorpore as claras em neve delicadamente. Leve à geladeira por 4 horas.',
      tempoPreparo: 240,
      categoria: 'doces',
      imagemUrl: 'assets/images/musse_chocolate.jpg',
    ),
    
    // Salgadas
    Receita(
      id: '4',
      titulo: 'Lasanha Bolonhesa',
      descricao: 'Lasanha tradicional com molho bolonhesa e queijo',
      ingredientes: [
        '500g de massa para lasanha',
        '500g de carne moída',
        '1 cebola picada',
        '2 dentes de alho',
        'Molho de tomate',
        'Queijo mussarela',
        'Queijo parmesão',
        'Molho branco',
      ],
      modoPreparo: 'Refogue a carne com cebola e alho. Monte a lasanha intercalando massa, molho bolonhesa, molho branco e queijo. Asse por 40 minutos a 180°C.',
      tempoPreparo: 60,
      categoria: 'salgadas',
      imagemUrl: 'assets/images/lasanha.png',
    ),
    Receita(
      id: '5',
      titulo: 'Risotto de Camarão',
      descricao: 'Risotto cremoso com camarões frescos',
      ingredientes: [
        '2 xícaras de arroz arbóreo',
        '500g de camarão limpo',
        '1 cebola pequena',
        '1 copo de vinho branco',
        'Caldo de camarão',
        'Queijo parmesão',
        'Manteiga',
      ],
      modoPreparo: 'Refogue a cebola, adicione o arroz e o vinho. Vá adicionando caldo aos poucos, mexendo sempre. Adicione os camarões no final e finalize com queijo e manteiga.',
      tempoPreparo: 40,
      categoria: 'salgadas',
      imagemUrl: 'assets/images/risoto.jpg',
    ),
    Receita(
      id: '6',
      titulo: 'Frango à Parmegiana',
      descricao: 'Frango empanado com molho de tomate e queijo',
      ingredientes: [
        '4 filés de frango',
        'Farinha de rosca',
        '2 ovos batidos',
        'Molho de tomate',
        'Queijo mussarela',
        'Queijo parmesão',
      ],
      modoPreparo: 'Empane os filés na farinha e ovo. Frite até dourar. Coloque molho de tomate e queijo por cima. Leve ao forno até o queijo derreter.',
      tempoPreparo: 50,
      categoria: 'salgadas',
      imagemUrl: 'assets/images/parmergiana.jpg',
    ),
    
    // Bebidas
    Receita(
      id: '7',
      titulo: 'Caipirinha de Limão',
      descricao: 'Bebida nacional brasileira refrescante',
      ingredientes: [
        '1 limão cortado em pedaços',
        '2 colheres de açúcar',
        'Cachaça',
        'Gelo',
      ],
      modoPreparo: 'Macere o limão com açúcar no copo. Adicione gelo e complete com cachaça. Misture bem.',
      tempoPreparo: 5,
      categoria: 'bebidas',
      imagemUrl: 'assets/images/caipirinha.jpg',
    ),
    Receita(
      id: '8',
      titulo: 'Vitamina de Frutas',
      descricao: 'Vitamina refrescante com frutas variadas',
      ingredientes: [
        '1 banana',
        '1/2 xícara de morangos',
        '1/2 xícara de manga',
        '200ml de leite',
        '1 colher de mel',
      ],
      modoPreparo: 'Bata todas as frutas com o leite e mel no liquidificador até ficar homogêneo. Sirva gelado.',
      tempoPreparo: 10,
      categoria: 'bebidas',
      imagemUrl: 'assets/images/smotie.png',
    ),
    Receita(
      id: '9',
      titulo: 'Café Gelado Especial',
      descricao: 'Café gelado cremoso com toque especial',
      ingredientes: [
        '1 xícara de café forte frio',
        '1/2 xícara de leite',
        '2 colheres de açúcar',
        'Gelo',
        'Chantilly',
        'Canela em pó',
      ],
      modoPreparo: 'Misture o café, leite e açúcar. Adicione gelo e bata. Sirva com chantilly e canela por cima.',
      tempoPreparo: 8,
      categoria: 'bebidas',
      imagemUrl: 'assets/images/cafe-gelado.jpg',
    ),
  ];

  static List<Receita> getReceitasPorCategoria(String categoria) {
    return receitas.where((receita) => receita.categoria == categoria).toList();
  }

  static Receita? getReceitaPorId(String id) {
    try {
      return receitas.firstWhere((receita) => receita.id == id);
    } catch (e) {
      return null;
    }
  }
}