import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/get_notes_cubit/get_note_cubit.dart';

import '../cubit/get_notes_cubit/get_note_state.dart';
import '../views/edit_note.dart';
import 'item_view.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNoteCubit()..getNotes(),
      child: BlocBuilder<GetNoteCubit,GetNoteState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              child:  ItemView(noteModel : BlocProvider.of<GetNoteCubit>(context).notes![index]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditNote(),
                    ));
              },
            ),
            itemCount: state is GetNoteSuccessState ? BlocProvider.of<GetNoteCubit>(context).notes!.length: 0,
          );
        },

      ),
    );
  }
}
