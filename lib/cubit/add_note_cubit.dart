import 'package:bloc/bloc.dart';

import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit() : super(AddNoteInitial());

  addNote(){

  }
}