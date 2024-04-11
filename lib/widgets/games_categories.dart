import 'package:demo_games/controller/GameController.dart';
import 'package:demo_games/models/GameModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utiles/dummy_data.dart';
import 'game_category.dart';

class GamesCategories extends StatelessWidget {
  // final List<GameModel> games;
  // bool categoryIsSelected = false;
  // GamesCategories({super.key, required this.games});

  GamesCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context);
    return Expanded(
        flex: 1,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            for (final game in gameController.games)
              GameCategory(
                gameCategory: game.category,
                //  isSelected: categoryIsSelected,
              )
          ],
        ));
  }
}
