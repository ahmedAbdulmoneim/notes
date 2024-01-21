import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/get_notes_cubit/get_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/custom_appbar.dart';
import 'package:notes/widgets/custom_text_field.dart';

import '../constant/constant.dart';
import '../widgets/color_item.dart';

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
              const SizedBox(
                height: 20,
              ),
              EditNoteColor(
                noteModel: widget.note,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditNoteColor extends StatefulWidget {
  const EditNoteColor({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

class _EditNoteColorState extends State<EditNoteColor> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = color.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.noteModel.color = color[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: color[index],
              isSelected: currentIndex == index,
            ),
          ),
        ),
        itemCount: color.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
