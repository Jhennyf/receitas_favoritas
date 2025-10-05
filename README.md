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

## 🎨 Design e UX
Versão 1 do sistema
![alt text](image.png)

## 🚀 Como Executar

1. **Pré-requisitos**:
   - Flutter SDK instalado
   - Dart SDK
   - Emulador ou dispositivo físico

2. **Instalação**:
   ```bash
   git clone [repository-url]
   cd receitas_favoritas
   flutter pub get
   ```

3. **Executar o app**:
   ```bash
   flutter run
   ```

## 🧪 Testes

Execute os testes com:
```bash
flutter test
```

## 📋 Receitas Incluídas

### Doces
- 🍫 Brigadeiro Gourmet
- 🍮 Pudim de Leite
- 🍰 Mousse de Chocolate

### Salgadas
- 🍝 Lasanha Bolonhesa
- 🦐 Risotto de Camarão
- 🍗 Frango à Parmegiana

### Bebidas
- 🍸 Caipirinha de Limão
- 🥤 Smoothie de Frutas
- ☕ Café Gelado Especial

## 🔄 Navegação

- **Tela Principal**: TabBar com as três categorias
- **Cards de Receita**: Toque para ver detalhes
- **Tela de Detalhes**: Botão voltar para retornar à categoria
- **Drawer**: Menu lateral com opções adicionais

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento
- **Material Design 3**: Design system
- **Dart**: Linguagem de programação

## 📝 Metodologia

O aplicativo foi desenvolvido seguindo os princípios de:
- **Experiência do usuário intuitiva**
- **Navegação fluida entre seções**
- **Hierarquia visual clara**
- **Consistência no design**

---

Desenvolvido com ❤️ usando Flutter
