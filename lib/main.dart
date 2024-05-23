import 'package:app1/view/giris_sayfasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GirisSayfasi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
