import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/cubit/get_notes_cubit/get_note_cubit.dart';
import 'package:notes/simple_bloc_observer/bloc_observer.dart';
import 'package:notes/views/notes_view.dart';
import 'models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNoteCubit()..getNotes(),
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            textTheme:
                const TextTheme(displayLarge: TextStyle(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        home: const NotesView(),
      ),
    );
  }
}
