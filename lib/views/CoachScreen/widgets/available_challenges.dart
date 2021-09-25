import 'package:coach_finder/data/data.dart';
import 'package:coach_finder/views/CoachScreen/widgets/challenge_card.dart';
import 'package:flutter/material.dart';

class AvailableChallenge extends StatelessWidget {
  const AvailableChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: List.generate(MyData.challengesImages.length,
            (index) => ChallengeCard(imageUrl: MyData.challengesImages[index])),
      ),
    );
  }
}
