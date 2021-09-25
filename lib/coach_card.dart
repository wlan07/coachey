import 'package:flutter/material.dart';

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
      child: Container(
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: Image.network(coachModel.imageUrl).image)),
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
                        flex: 2,
                        child: Text(
                          coachModel.fullName,
                          style: TextStyle(fontSize: 35.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          coachModel.fieldName,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          coachModel.nbChallenge.toString() + " Challenges",
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
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
