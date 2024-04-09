import '../models/GameModel.dart';
import '../utiles/dummy_data.dart';
import 'package:flutter/material.dart';
import '../screens/game_details.dart';
import '../utiles/app_colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class TopGames extends StatelessWidget {
  final List<GameModel> games;
  TopGames({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          for (int i = 0; i < games.length; i++)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          games[i].thumb,
                          fit: BoxFit.cover,
                          width: 80,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            games[i].title,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SmoothStarRating(
                                  starCount: 1,
                                  rating: 1,
                                  size: 12.0,
                                  filledIconData: Icons.star,
                                  // halfFilledIconData: Icons.star,
                                  color: Colors.yellowAccent,
                                  borderColor: Colors.yellowAccent,
                                  spacing: 0.0),
                              SizedBox(
                                width: 8,
                              ),
                              Text("4 Stars"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GameDetails2(game: games[i])));
                      },
                      child: Text(
                        "Play",
                        style: TextStyle(color: KTextColorWhite),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: KButtonColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
        ],
      ),
    );
  }
}
