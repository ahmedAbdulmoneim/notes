import 'package:flutter/material.dart';
import 'package:notes/widgets/Item_view.dart';
import 'package:notes/widgets/addNote.dart';

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
                builder: (context) => const AddNote());
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Notes View',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ItemView(),
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
