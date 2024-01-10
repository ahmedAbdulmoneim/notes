import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_appbar.dart';
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
              const CustomAppBar(icon: Icons.done, title: 'Edit Note'),
              const SizedBox(
                height: 20,
              ),
              defaultFormField(maxLine: 1, label: 'Title'),
              const SizedBox(
                height: 10,
              ),
              defaultFormField(maxLine: 5, label: 'Content'),
            ],
          ),
        ),
      ),
    );
  }
}
