import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentTime = 'Loading';
  Timer? timer;

  @override
  void initState() {
    _startClock();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          currentTime,
          style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _startClock() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateFormat('MM-dd HH:mm:ss').format(DateTime.now());
      });
    });
  }
}
