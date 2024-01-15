import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/cubit/get_notes_cubit/get_note_state.dart';
import 'package:notes/models/note_model.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitialState());

  List<NoteModel>? notes;
   getNotes() {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
       notes =  notesBox.values.toList();
      print('${notes!.length}');
      emit(GetNoteSuccessState());

  }
  refreshNotes(){
     getNotes();
  }
}
