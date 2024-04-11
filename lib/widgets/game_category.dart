import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/GameController.dart';

class GameCategory extends StatelessWidget {
  final String gameCategory;
  // bool isSelected;

  GameCategory({super.key, required this.gameCategory});

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        padding: EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(20)),
        label: Text(
          gameCategory,
          style: TextStyle(color: Color(0xff30429F)),
        ),
        shadowColor: Colors.black,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
