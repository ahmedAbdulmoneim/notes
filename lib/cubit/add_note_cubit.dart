import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/models/noteModel.dart';

import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel noteModel)async{
    emit(AddNoteLoading());
    try{
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      await notesBox.add(noteModel);
      emit(AddNoteSuccess());
    }catch (e){
      print('error her $e');
      emit(AddNoteFailure());
    }


  }
}