import 'package:flutter/material.dart';

Widget defaultFormField({
  String? label,

  int? maxLine,


}) => TextFormField(
  cursorColor: Colors.greenAccent,
  maxLines: maxLine,
  decoration: InputDecoration(
    labelText: label ,
    labelStyle: const TextStyle(
      color: Colors.greenAccent,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.greenAccent)
    ),

  ),
);

