import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/views/notesView.dart';

void main() async{

  await Hive.initFlutter();
  await Hive.openBox('notes box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: NotesView(),
    );
  }
}

