import '../../models/note_model.dart';

abstract class GetNoteState{}

class GetNoteInitialState extends GetNoteState{}

class GetNoteLoadingState extends GetNoteState{}

class GetNoteSuccessState extends GetNoteState{
  final List<NoteModel> notes;

  GetNoteSuccessState(this.notes);
}

class GetNoteFailureState extends GetNoteState{
  final String errorMessage;

  GetNoteFailureState(this.errorMessage);

}