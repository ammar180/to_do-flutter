import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/to_do_provider.dart';
import 'package:to_do/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ToDoProvider(),
        child: MyHomePage(),
      ),
    );
  }
}
