import 'dart:math';
import 'package:provider/provider.dart';

import '../controller/GameController.dart';
import '../models/GameModel.dart';
import '../utiles/dummy_data.dart';
import 'package:flutter/material.dart';
import '../screens/game_details.dart';
import '../utiles/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../utiles/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class GamesSlider extends StatelessWidget {
  // final List<GameModel> games;

  GamesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context);
    return Expanded(
      flex: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: CarouselSlider(
          items: [
            for (final game in gameController.games)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        game.thumb,
                        fit: BoxFit.cover,
                        width: 400,
                      ),
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    Positioned(
                      child: SmoothStarRating(
                          starCount: 5,
                          rating: 2 + Random().nextInt(4).toDouble(),
                          size: 18.0,
                          filledIconData: Icons.star,
                          // halfFilledIconData: Icons.star,
                          color: Colors.yellowAccent,
                          borderColor: Colors.yellowAccent,
                          spacing: 0.0),
                      bottom: 50,
                      left: 20,
                    ),
                    Positioned(
                      child: Text(
                        game.title,
                        style: TextStyle(
                            color: Color(0xffFCFCFC),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      bottom: 20,
                      left: 20,
                    )
                  ],
                ),
              ),
          ],
          options: CarouselOptions(height: 200.0),
        ),
      ),
    );
  }
}
