import 'package:demo_games/controller/GameController.dart';
import 'package:demo_games/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
    //   MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Home(),
    // );
  }
}

//https://www.youtube.com/watch?v=GKBJf0dR4mw
//https://www.figma.com/file/rvo2o3NVmYgS8EHng94icr/Game-UI-Design-with-scrolling-Animations-(Community)?type=design&node-id=1-2&mode=design&t=oso4DspCh3y9P2rq-0