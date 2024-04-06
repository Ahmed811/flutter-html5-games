import 'package:demo_games/screens/game_screen.dart';
import 'package:demo_games/utiles/app_colors.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../utiles/dummy_data.dart';

class GameDetails2 extends StatefulWidget {
  final GameItem gameItem;
  const GameDetails2({Key? key, required this.gameItem}) : super(key: key);

  @override
  State<GameDetails2> createState() => _GameDetails2State();
}

class _GameDetails2State extends State<GameDetails2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: .5,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                KScaffoldColor1,
                KScaffoldColor2,
                KScaffoldColor1,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        DraggableHome(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 40,
                color: KTextColorWhite,
              )),

          title: Text(
            widget.gameItem.title,
            style: TextStyle(color: KTextColorWhite),
          ),

          headerWidget: Image.network(widget.gameItem.thumb,
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .6),
          // headerBottomBar: headerBottomBarWidget(),
          body: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      KScaffoldColor1,
                      KScaffoldColor2,
                      KScaffoldColor3,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Text(
                            widget.gameItem.title,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1E2D7C)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SmoothStarRating(
                                  starCount: 1,
                                  rating: 1,
                                  size: 20.0,
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
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Game Description",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: KTextColorBlack),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.gameItem.description,
                            style:
                                TextStyle(fontSize: 16, color: KTextColorBlack),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "How To Play",
                            style: TextStyle(
                                fontSize: 18,
                                color: KTextColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.gameItem.instructions,
                            style:
                                TextStyle(fontSize: 16, color: KTextColorBlack),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            // Set the desired width here
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GameScreen()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xff5B6CC6),
                                    borderRadius: BorderRadius.circular(50)),
                                width: 170,
                                height: 56,
                                child: Text(
                                  "Play",
                                  style: TextStyle(
                                      color: KTextColorWhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          fullyStretchable: true,
          // expandedBody: const CameraPreview(),
          //backgroundColor: Colors.transparent,
          appBarColor: Colors.teal,
        )
      ],
    );
  }
}
