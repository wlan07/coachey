import 'package:coach_finder/challenge_card.dart';
import 'package:flutter/material.dart';

class AvailableChallenge extends StatelessWidget {
  const AvailableChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [...List.generate(15, (index) => ChallengeCard())],
      ),
    );
  }
}
