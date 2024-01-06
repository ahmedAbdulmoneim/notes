import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({Key? key,required this.icon,required this.title}) : super(key: key);
  String title;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
        style: TextStyle(
          fontSize: 20,
        ),),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(onPressed: (){},icon: Icon(icon),),
        )
      ],
    );
  }
}
