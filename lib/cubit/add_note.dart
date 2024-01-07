import 'package:bloc/bloc.dart';

import 'notesState.dart';

class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit() : super(AddNoteInitial());
}