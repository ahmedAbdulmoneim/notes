import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/cubit/add_note_cubit.dart';
import 'package:notes/widgets/addNote.dart';

import '../cubit/add_note_states.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<AddNoteCubit,AddNoteState>(
        listener: (context, state) {
          if(state is AddNoteFailure){
            print('error happened ');
          }
          if(state is AddNoteSuccess){
            Navigator.pop(context);
          }

        },
          builder: (context, state) {
           return ModalProgressHUD(
             inAsyncCall: state is AddNoteLoading ? true : false,
             child: AddNoteForm(),
           );

          },

    )
    );
  }
}
