import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubit/add_notes_cubit/add_note_cubit.dart';
import 'package:notes/cubit/add_notes_cubit/add_note_states.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/color_item.dart';
import 'package:notes/widgets/color_list_view.dart';
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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
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
                  onSaved: (value) {
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
                  onSaved: (value) {
                    subtitle = value;
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'this field is required ';
                    } else {
                      return null;
                    }
                  }),
              const Spacer(),
              const SizedBox(
                height: 24*2,
                child: ColorListView(),
              ),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  isLoading = state is AddNoteLoading ? true : false;
                  return ElevatedButton(
                    onPressed: () {

                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var noteModel = NoteModel(
                            subtitle: subtitle!,
                            title: title!,
                            date: DateFormat("MMMM d, yyyy").format(DateTime.now()),
                            color: Colors.blue.value
                        );
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
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
                    child: isLoading
                        ? const SizedBox(
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ))
                        : const Text(
                            "Add",
                            style: TextStyle(color: Colors.black),
                          ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
