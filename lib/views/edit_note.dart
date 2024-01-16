import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/get_notes_cubit/get_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/custom_appbar.dart';
import 'package:notes/widgets/textFormField.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
   String? title;
   String? subtitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.done,
                title: 'Edit Note',
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = subtitle ?? widget.note.subtitle;
                  widget.note.save();
                  BlocProvider.of<GetNoteCubit>(context).getNotes();
                  Navigator.pop(context);

                },
              ),
              const SizedBox(
                height: 20,
              ),
              defaultFormField(
                  maxLine: 1,
                  label: widget.note.title,
                  onChange: (value) {
                    title = value;
                  }),
              const SizedBox(
                height: 10,
              ),
              defaultFormField(
                  maxLine: 5,
                  label: widget.note.subtitle,
                  onChange: (value) {
                    subtitle = value;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
