import 'package:flutter/material.dart';
import 'stateless_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prak 2',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const BerandaStateless(), // Menjadikan Stateless Page sebagai halaman pertama
    );
  }
}