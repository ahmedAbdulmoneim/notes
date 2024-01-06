import 'package:flutter/material.dart';
import 'package:notes/widgets/customAppBar.dart';
import 'package:notes/widgets/textFormField.dart';

class EditNote extends StatelessWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomAppBar(icon: Icons.done, title: 'Edit Note'),
              SizedBox(height: 20,),
              defaultFormField(maxLine: 1,label: 'Title'),
              SizedBox(height: 10,),
              defaultFormField(maxLine: 5,label: 'Content'),
            ],
          ),
        ),
      ),
    );
  }
}
