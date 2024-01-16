import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/get_notes_cubit/get_note_cubit.dart';
import 'package:notes/models/note_model.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(10)),
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(top: 20, left: 15, bottom: 15),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noteModel.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        noteModel.subtitle,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: IconButton(
                    onPressed: () {
                      noteModel.delete();
                      BlocProvider.of<GetNoteCubit>(context).refreshNotes();
                    },
                    icon: const Icon(Icons.delete_sharp),
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only( right: 10.0),
                  child: Text(
                    noteModel.date,
                    style:  const TextStyle(color: Colors.black54, fontSize: 15,),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
