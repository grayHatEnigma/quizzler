import 'package:flutter/material.dart';

class Score {
  int score = 0;

  List<Icon> scoreBar = [];

  void addIcon(Icon icon) {
    scoreBar.add(icon);
  }

  void resetScore() {
    scoreBar.clear();
    score = 0;
  }
}
