import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/add_notes_cubit/add_note_cubit.dart';

import 'color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  List<Color> color = const[
    Color(0xFF40768C),
    Color(0xFF3ECCBB),
    Color(0xFFECCE83),
    Color(0xFFF29040),
    Color(0xFFEE9781),


  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: GestureDetector(
          onTap: (){
            currentIndex = index;
            BlocProvider.of<AddNoteCubit>(context).color = color[index];
            setState(() {

            });
          },
          child: ColorItem(
            color: color[index],
            isSelected: currentIndex == index,
          ),
        ),
      ),
      itemCount: color.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
