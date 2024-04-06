import 'package:flutter/material.dart';

import '../utiles/dummy_data.dart';
import 'game_category.dart';

class GamesCategories extends StatelessWidget {
  bool categoryIsSelected = false;
  GamesCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            for (int i = 0; i < games.length; i++)
              GameCategory(
                gameCategory: games[i].category,
                isSelected: categoryIsSelected,
                key: Key(i.toString()),
              )
          ],
        ));
  }
}
