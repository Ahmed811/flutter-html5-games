import 'package:flutter/material.dart';

class GameCategory extends StatefulWidget {
  final String gameCategory;
  bool isSelected;

  GameCategory(
      {super.key, required this.gameCategory, required this.isSelected});

  @override
  State<GameCategory> createState() => _GameCategoryState();
}

class _GameCategoryState extends State<GameCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.isSelected = !widget.isSelected;
          });
        },
        child: Chip(
          padding: EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
              side: BorderSide.none, borderRadius: BorderRadius.circular(20)),
          label: Text(
            widget.gameCategory,
            style: TextStyle(
                color:
                    widget.isSelected ? Color(0xffffffff) : Color(0xff30429F)),
          ),
          shadowColor: Colors.black,
          backgroundColor: widget.isSelected ? Color(0xff5B6CC6) : Colors.grey,
        ),
      ),
    );
  }
}
