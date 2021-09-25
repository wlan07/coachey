class CoachModel {
  final String imageUrl;
  final String fullName;
  final String fieldName;
  final int nbChallenge;

  const CoachModel(
      {required this.imageUrl,
      required this.fullName,
      this.fieldName="Lorem Ipsum",
      required this.nbChallenge});
}
