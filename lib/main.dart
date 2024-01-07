import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("test")),
        drawer: Drawer(
          child: Column(children: [Text("asdasd")]),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
