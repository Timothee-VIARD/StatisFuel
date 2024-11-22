import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statisfuel/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
        title: 'TramBusTrain',
        debugShowCheckedModeBanner: false,
        home: MainPage());
  }
}