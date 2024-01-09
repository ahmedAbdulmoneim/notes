import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/add_note_cubit.dart';
import 'package:notes/models/noteModel.dart';
import 'package:notes/widgets/textFormField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? subtitle;
  String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              defaultFormField(
                  maxLine: 1,
                  label: 'Title',
                  onSubmitted: (value) {
                    title = value;
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'this field is required ';
                    } else {
                      return null;
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              defaultFormField(
                  maxLine: 6,
                  label: 'Content',
                  onSubmitted: (value) {
                    subtitle = value;
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'this field is required ';
                    } else {
                      return null;
                    }
                  }),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                        subtitle: subtitle ?? '',
                        title: title ?? '',
                        date: DateTime.now().toString(),
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.greenAccent,
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
