import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/fight_result_widget.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FightClubColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: const Text(
                "Statistics",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: FightClubColors.darkGreyText,
                ),
              ),
            ),
            const Expanded(child: SizedBox()), //.shrink()
            FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const SizedBox();
                }
                final SharedPreferences sp = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Won: ${sp.getInt("stats_won") ?? 0}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: FightClubColors.darkGreyText,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Draw: ${sp.getInt("stats_draw") ?? 0}",
                      style: const TextStyle(
                        fontSize: 16,
                        height: 2.5,
                        color: FightClubColors.darkGreyText,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Lost: ${sp.getInt("stats_lost") ?? 0}",
                      style: const TextStyle(
                        fontSize: 16,
                        height: 2.5,
                        color: FightClubColors.darkGreyText,
                      ),
                    ),
                  ],
                );
              },
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SecondaryActionButton(
                text: "Back",
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
