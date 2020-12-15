import 'dart:math';

import 'package:flutter/material.dart';

class ColorsProvider with ChangeNotifier {
  Color _color = Colors.white;

  Color get color => _color;

  set color(Color newValue) {
    _color = newValue;
    notifyListeners();
  }

  getRandomColor() {
    int r = Random().nextInt(255);
    int g = Random().nextInt(255);
    int b = Random().nextInt(255);
    color = Color.fromARGB(100, r, g, b);
    notifyListeners();
  }
}
