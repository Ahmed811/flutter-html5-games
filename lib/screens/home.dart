import 'dart:convert';

import 'package:demo_games/controller/GameController.dart';
import 'package:demo_games/models/GameModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../utiles/app_colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../widgets/games_categories.dart';
import '../widgets/games_slider.dart';
import '../widgets/top_games.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Home({super.key});

  // Define your pages here
  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context);
    gameController.fetchGames();
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      //لا يمكن عمل تدرج لوني الي بداخل كونتر
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/menu.svg', // Path to your SVG file
            width: 24, // Adjust the size as needed
            height: 24,
          ), // Your custom icon here
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
            //not working because the button do not access to context
            // Scaffold.of(context)
            //     .openDrawer(); // Open the drawer when the icon is pressed
          },
        ),
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xff3D318B),
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.settings, title: 'Setting'),
        ],
        onTap: (index) {
          if (index == 1) {
            _openBottomSheet(context);
          }
        },
      ),

      body: Stack(
        children: [
          //app background
          buildBackground(context: context),
          Padding(
            padding: const EdgeInsets.only(
                top: 110.0, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Browse Games",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: KTextColorBlue),
                ),
                const SizedBox(
                  height: 10,
                ),
                //categories////////////////////
                GamesCategories(),
                //slider/////////////////////////////////////////////////////////////////////
                GamesSlider(),
                const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Top games",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E2D7C)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //top games/////////////////////////////////////////////////////////////////////
                TopGames()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//home background
Widget buildBackground({required BuildContext context}) {
  return Opacity(
    opacity: .5,
    child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [KScaffoldColor1, KScaffoldColor2, KScaffoldColor3],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    ),
  );
}

void _openBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'This is a bottom sheet',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
