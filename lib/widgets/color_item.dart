import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key,required this.color,required this.isSelected}) : super(key: key);
  final Color? color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected ? CircleAvatar(
      radius: 28,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: color,
      ),
    ): CircleAvatar(
      radius: 28,
      backgroundColor: color,
    );
  }
}
