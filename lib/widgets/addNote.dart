

import 'package:flutter/material.dart';
import 'package:notes/widgets/textFormField.dart';



class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
         defaultFormField(maxLine: 1,label: 'Title'),
          const SizedBox(
            height: 10,
          ),

          defaultFormField(maxLine: 6,label: 'Content'),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.greenAccent,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("Add"),
          )
        ],
      ),
    );
  }
}
