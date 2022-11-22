import 'package:flutter/material.dart';
import 'package:http_tutorial/models/http_provider.dart';
import 'package:http_tutorial/pages/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (context) => HttpProvider(), child: const HomeProvider()),
    );
  }
}
