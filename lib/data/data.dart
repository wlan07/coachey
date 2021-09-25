import 'package:coach_finder/models/coach_model.dart';

class MyData {
  static const List<CoachModel> coaches = [
    
    CoachModel(
        fullName: "Thales of miletus",
        nbChallenge: 10,
        imageUrl: "assets/images/thales.png"
  ),

    CoachModel(
        fullName: "Leonardo da Vinci",
        nbChallenge: 15,
        imageUrl: "assets/images/leonardo.jpg"
    ),
    CoachModel(
        fullName: "Thomas Edison",
        nbChallenge: 12,
        imageUrl: "assets/images/thomas.jpg"
            ),
    CoachModel(
        fullName: "Archimedes",
        nbChallenge: 10,
        imageUrl: "assets/images/arsimet.jpg"
            ),
    CoachModel(
        fullName: "Nikola Tesla",
        nbChallenge: 12,
        fieldName: "Inventor",
        imageUrl: "assets/images/tesla.jpeg"
            )
  ];

static const List<String> challengesImages = [
  "assets/images/c1.jpg",
  "assets/images/c2.jpg",
  "assets/images/c3.jpg"
];

}
