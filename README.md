<h1 align="center">Flutter-dex</h1>

<p align="center">
    <img src="https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white"/>
    <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white"/>
</p>

- [📑 Sobre o projeto](#-sobre)
- [📂 Estrutura do projeto](#-estrutura-de-projeto)
- [🚀 Começando](#-comecando)

## 📑 Sobre
Código desenvolvido para o mini projeto da disciplina de Poo do curso de sistemas de informação
O projeto se trata de uma PokeDex, uma enciclopédia de Pokemon, que puxa dados de uma [api](https://pokeapi.co). A pokedex exibe diversos pokemons, possuindo informações detalhadas sobre cada um e seus tipos. O código foi desenvolvido utilizando a linguagem dart e o framework Flutter. 

## 📂 Estrutura do projeto
```
flutter_dex
├─ lib
│  ├─ components
│  │  ├─ appBar.dart
│  │  ├─ bottomNavBar.dart
│  │  ├─ buttomQuiz.dart
│  │  ├─ buttomRegions.dart
│  │  └─ homeButtom.dart
│  ├─ detail
│  │  ├─ datailPokemon.dart
│  │  │  └─ pkmView.dart
│  ├─ homepage
│  │  ├─ cardView.dart
│  │  ├─ filterPage.dart
│  │  └─ homePage.dart
│  ├─ main.dart
│  ├─ quiz
│  │  ├─ quizView.dart
│  │  └─ telaQuiz.dart
│  ├─ search
│  │  ├─ SearchInput.dart
│  │  └─ telaSearch.dart
│  └─ utils
│     ├─ captalize.dart
│     ├─ colors.dart
│     ├─ dexfonts.dart
│     ├─ loading.dart
│     └─ search.dart
├─ pubspec.lock
└─ pubspec.yaml

```


## 🚀 Comecando

### Passo 1: Clone o repositório
```git clone https://github.com/mts-lucas/flutter-dex.git```

### Passo 2: Navegue até o repositório
```cd flutter-dex```

### Passo 3: Baixe as dependencias necessárias
```flutter pub get```

### Passo 4: Execute o projeto: 
```flutter run```

## Licença

Este projeto é licenciado sob a licença [MIT](LICENSE).
