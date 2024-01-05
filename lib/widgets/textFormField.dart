import 'package:flutter/material.dart';

Widget defaultFormField({
  String? label,
   required double vertical,
   required double horizontal,



}) => TextFormField(
  cursorColor: Colors.greenAccent,
  decoration: InputDecoration(
    labelText: label ,
    labelStyle: const TextStyle(
      color: Colors.greenAccent,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: vertical,horizontal: horizontal) ,
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

