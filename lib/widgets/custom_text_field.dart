import 'package:flutter/material.dart';

Widget defaultFormField({
  String? label,
  int? maxLine,
  onSaved,
  validate,
  onChange,
}) =>
    TextFormField(
      onSaved: onSaved,
      validator: validate,
      onChanged: onChange,
      cursorColor: Colors.greenAccent,
      maxLines: maxLine,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.greenAccent,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.greenAccent)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
