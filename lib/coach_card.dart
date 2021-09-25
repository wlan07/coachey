import 'package:coach_finder/coach_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as f;

class CoachCard extends StatelessWidget {
  const CoachCard(
      {Key? key,
      required this.coachModel,
      required this.animation,
      required this.color,
      required this.index})
      : super(key: key);

  final CoachModel coachModel;
  final Color color;
  final int index;

  void _onTap(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
        reverseTransitionDuration: const Duration(milliseconds: 400),
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (_, __, ___) {
          return FadeTransition(
            opacity: __,
            child: CoachDetails(
              coachModel: coachModel,
              tag: "COACH$index",
            ),
          );
        }));
  }

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            child: __,
            offset: Offset(index % 2 == 0 ? -100 : 100, 100) *
                (1 - animation.value),
          ),
        );
      },
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Hero(
                    tag: "COACH$index",
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: Image.network(coachModel.imageUrl).image)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            coachModel.fullName,
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            coachModel.fieldName,
                            style: f.GoogleFonts.spaceGrotesk(fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                              coachModel.nbChallenge.toString() + " Challenges",
                              style: f.GoogleFonts.spaceGrotesk().copyWith(
                                  fontSize: 15.0, color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class CoachModel {
  final String imageUrl;
  final String fullName;
  final String fieldName;
  final int nbChallenge;

  const CoachModel(
      {required this.imageUrl,
      required this.fullName,
      required this.fieldName,
      required this.nbChallenge});
}
