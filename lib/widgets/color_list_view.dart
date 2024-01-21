import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/add_notes_cubit/add_note_cubit.dart';

import '../constant/constant.dart';
import 'color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = color[index];
              setState(() {});
            },
            child: ColorItem(
              color: color[index],
              isSelected: currentIndex == index,
            ),
          ),
        ),
        itemCount: color.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
