class Receita {
  final String id;
  final String titulo;
  final String descricao;
  final List<String> ingredientes;
  final String modoPreparo;
  final String categoria;
  final String imagemUrl;

  Receita({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.ingredientes,
    required this.modoPreparo,
    required this.categoria,
    required this.imagemUrl,
  });
}