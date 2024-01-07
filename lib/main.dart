import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  File? xmlFile = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Set Preparation")),
        drawer: Drawer(
          child: Column(children: [
            ListTile(
              title: Text("Settings"),
            ),
            ListTile(
              title: Text("About"),
            )
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ]),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello World!'),
            TextButton(onPressed: pickFile, child: Text("Open XML")),
            Text('Selected file: ${xmlFile?.path}'),
          ],
        ),
      ),
    );
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["xml"]);

    if (result == null) {
      throw Exception("Should handle error");
    }

    List<File> files = result.paths.map((path) => File(path!)).toList();

    if (files.length > 1) {
      throw Exception("Should handle error");
    }

    setState(() {
      xmlFile = files[0];
    });
  }
}
