
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/add_note_cubit.dart';
import 'package:notes/widgets/add_note_form.dart';

import '../cubit/add_note_states.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
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
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ?true:false,
            child: const AddNoteForm(),
          );
        },




      ),
    );
  }
}
