import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoachAboutDetails extends StatelessWidget {
  const CoachAboutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            indent: 70.0,
            endIndent: 60.0,
            color: Colors.blue.withOpacity(0.6),
          ),
          Row(
            children: [
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 5,
                child: Text.rich(
                    TextSpan(text: "// ", children: [
                      TextSpan(
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue.withOpacity(0.6)),
                          text:
                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, ")
                    ]),
                    style: GoogleFonts.spaceGrotesk().copyWith(fontSize: 20.0)),
              ),
              Spacer()
            ],
          ),
          Divider(
            indent: 70.0,
            endIndent: 60.0,
            color: Colors.blue.withOpacity(0.6),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Expertise Area",
              style: TextStyle(
                  color: Colors.blue.withOpacity(0.6),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w100),
            ),
          ),
          const ExpertiseArea(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Degree & Experience",
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.6),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years",
                      style: GoogleFonts.spaceGrotesk().copyWith(
                          fontSize: 16.0, color: Colors.blue.withOpacity(0.6))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ExpertiseArea extends StatelessWidget {
  const ExpertiseArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10.0,
        runSpacing: 10.0,
        children: [
          ...List.generate(
              6,
              (index) => Container(
                    child: Text(
                      "expertise_area$index",
                      style:
                          GoogleFonts.spaceGrotesk().copyWith(fontSize: 15.0),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25.0)),
                    padding: EdgeInsets.all(10.0),
                  ))
        ],
      ),
    );
  }
}
