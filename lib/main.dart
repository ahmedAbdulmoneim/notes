import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/cubit/add_note_cubit.dart';
import 'package:notes/simple_bloc_observer/bloc_observer.dart';
import 'package:notes/views/notesView.dart';
import 'models/noteModel.dart';

void main() async{

  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes box');
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesView(),
    );
  }
}

