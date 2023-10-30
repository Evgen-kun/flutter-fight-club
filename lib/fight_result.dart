import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';

class FightResult {
  final String result;
  final Color color;

  const FightResult._(this.result, this.color);

  static const won = FightResult._("Won", FightClubColors.wonColor);
  static const lost = FightResult._("Lost", FightClubColors.lostColor);
  static const draw = FightResult._("Draw", FightClubColors.drawColor);

  static FightResult? calculateResult(
      final int yourLives, final int enemysLives) {
    if (yourLives == 0 && enemysLives == 0) {
      return draw;
    } else if (yourLives == 0) {
      return lost;
    } else if (enemysLives == 0) {
      return won;
    }
    return null;
  }

  static const values = [won, lost, draw];

  static FightResult getFightResultByName(String name) {
    return values.firstWhere((fightResult) => fightResult.result == name);
  }

  @override
  String toString() {
    return 'FightResult{result: $result}';
  }
}