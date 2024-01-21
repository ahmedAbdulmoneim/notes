import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/models/note_model.dart';

import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xFF40768C);

  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure());
    }
  }
}
