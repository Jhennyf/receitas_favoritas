# 🍽️ Receitas Favoritas

Um aplicativo Flutter intuitivo para explorar e descobrir receitas deliciosas organizadas por categorias.

## 📱 Funcionalidades

- **Navegação por Abas**: Explore receitas organizadas em três categorias principais:
  - 🧁 **Doces**: Sobremesas e doces irresistíveis
  - 🍝 **Salgadas**: Pratos principais e petiscos
  - 🥤 **Bebidas**: Drinks e bebidas refrescantes

- **Cards Interativos**: Cada receita é apresentada em um card elegante com:
  - Título da receita
  - Descrição breve
  - Ícone representativo da categoria

- **Detalhes Completos**: Ao tocar em uma receita, acesse:
  - Título e descrição detalhada
  - Lista completa de ingredientes
  - Modo de preparo passo a passo

- **Menu Lateral (Drawer)**: Acesso rápido a:
  - ⚙️ Configurações do app
  - ℹ️ Informações sobre o aplicativo

## 🏗️ Estrutura do Projeto

```
lib/
├── main.dart                    # Ponto de entrada do app
├── models/
│   └── receita.dart            # Modelo de dados da receita
├── data/
│   └── receitas_data.dart      # Dados mockados das receitas
├── screens/
│   ├── home_screen.dart        # Tela principal com abas
│   ├── detalhes_receita_screen.dart  # Tela de detalhes
│   ├── configuracoes_screen.dart     # Tela de configurações
│   └── sobre_screen.dart       # Tela sobre o app
└── widgets/
    └── receita_card.dart       # Widget do card da receita
```

## Recursos principais

- Navegação por abas (Doces, Salgadas, Bebidas)
- Cards com resumo das receitas
- Tela de detalhes (ingredientes e modo de preparo)
- CRUD: adicionar, editar e remover receitas (com opção de desfazer)
- Autenticação simples (login/cadastro, armazenados em memória)
- Suporte para imagens locais em `assets/images/`

## Estrutura do projeto

```
lib/
├─ main.dart
├─ models/        # modelos (Receita, Usuario)
├─ data/          # dados de exemplo
├─ providers/     # lógica de estado (Provider)
├─ screens/       # telas do app (login, home, detalhes...)
└─ widgets/       # componentes reutilizáveis
```

## Começando (rápido)

1. Clone o repositório e entre na pasta:

```bash
git clone <repo-url>
cd receitas_favoritas
```

2. Instale dependências e rode no Chrome:

```bash
flutter pub get
flutter run -d chrome
```

## Testes

```bash
flutter test
```

## Observações técnicas

- Persistência: os dados atuais são mantidos em memória. Para persistência entre execuções, recomendo integrar Hive, SharedPreferences ou SQLite.
- Autenticação: mecanismo local para demonstração — em produção use um backend e hashing/armazenamento seguro de credenciais.

## Como contribuir

- Faça um fork, crie uma branch com a melhoria, e abra um PR.
- Exemplos de melhorias úteis: seleção de imagens, persistência, testes e melhorias de acessibilidade.


Desenvolvido com ❤️
