import 'package:flutter/material.dart';
import 'package:notes/views/editNotes.dart';
import 'package:notes/widgets/Item_view.dart';
import 'package:notes/widgets/add_note_bottom_sheet.dart';
import 'package:notes/widgets/customAppBar.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                builder: (context) => const AddNoteBottomSheet());
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
             CustomAppBar(title: "Notes ", icon: Icons.search),
              SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(child: ItemView(),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditNote (),));},),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
