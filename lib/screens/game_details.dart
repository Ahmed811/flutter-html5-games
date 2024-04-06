import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class GameDetails extends StatelessWidget {
  const GameDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: .5,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(
                    0xff9FAFFF,
                  ),
                  Color(0xffFD84DB),
                  Color(
                    0xff9FAFFF,
                  ),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.network(
                "https://img.gamemonetize.com/nxotysqbir7qxsp2qw432ybzfiji436v/512x384.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .6),
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      Color(
                        0xff9FAFFF,
                      ),
                      Color(0xffFD84DB),
                      Color(
                        0xffFFFFFF,
                      ),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Text(
                      "Home Rush The Fish Fight",
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
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Rock-Paper-Scissors is a simulator and a classic guessing game where players can choose different numbers of rocks, paper, and scissors to fight. These rocks, paper, and scissors are like a group of hungry beasts, running wildly on the game field until only one type remains. Players can control the games pace by adjusting the movement speed. Fast-paced games are more exciting and will make your adrenaline rush.",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      // Set the desired width here
                      child: InkWell(
                        onTap: () {},
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
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
