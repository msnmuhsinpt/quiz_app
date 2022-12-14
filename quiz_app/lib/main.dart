import 'package:flutter/material.dart';
import 'package:quiz_app/util/app_rout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/counter',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
