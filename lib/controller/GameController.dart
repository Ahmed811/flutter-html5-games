import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/GameModel.dart';

class GameController extends ChangeNotifier {
  List<GameModel> _games = [];

  List<GameModel> get games => _games;

  Future<void> fetchGames() async {
    final response = await http
        .get(Uri.parse("https://games.animegadid.com/top-games.json"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      _games = data.map((json) => GameModel.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
