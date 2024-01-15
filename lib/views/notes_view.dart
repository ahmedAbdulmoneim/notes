import 'package:flutter/material.dart';
import 'package:notes/widgets/add_note_bottom_sheet.dart';
import 'package:notes/widgets/notes_list_view.dart';

import '../widgets/custom_appbar.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddNoteBottomSheet(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: "Notes ", icon: Icons.search),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: NotesListView(),
            ),
          ],
        ),
      ),
    ));
  }
}
