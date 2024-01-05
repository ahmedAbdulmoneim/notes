import 'dart:developer';

import 'package:flutter/material.dart';



class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
            ),
            child: Center(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(7)
                    // ),

                    ),
              ),
            ),
          ),
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
