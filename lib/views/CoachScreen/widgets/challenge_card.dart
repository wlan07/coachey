import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({Key? key,required this.imageUrl}) : super(key: key);

  final String  imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      height: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: Image.asset("$imageUrl").image
                ),
                  color: Colors.red, borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("30 DAYS OF CODING"),
          Row(
            children: [
              Text(
                "01.03.2021 - 30\$",
                style: TextStyle(
                  fontFamily: "Space",
                  fontSize: 18.0),
              ),
              Spacer(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Lorem ipsum",
                    style: TextStyle(
                      fontFamily:  "Space",
                      fontSize: 18.0),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25.0)),
                  padding: EdgeInsets.all(10.0),
                ),
              )
            ],
          )
        ],
      ),
      width: double.infinity,
    );
  }
}
