import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPGui',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    home: const HomeScreen(),
    );
  }
}