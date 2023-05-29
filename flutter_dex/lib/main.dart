import 'package:flutter/material.dart';
import 'package:flutter_dex/components/homeButtom.dart';
import 'package:flutter_dex/components/bottomNavBar.dart';
import 'package:flutter_dex/homepage/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dex basic',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'principal',
      routes: {
        'principal': (context) => DexHomePage(),
        'telaregions': (context) => TelaRegion(),
        'telaquiz': (context) => TelaQuiz(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dex basics'),
      ),
      body: const Center(
        child: Text(
          'Página Principal',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: DexAppBar(),
    );
  }
}

class TelaQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dex basics'),
      ),
      body: const Center(
        child: Text(
          'Página quiz',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: DexAppBar(),
    );
  }
}

class TelaRegion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dex basics'),
      ),
      body: const Center(
        child: Text(
          'Página Regioes',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: DexAppBar(),
    );
  }
}
