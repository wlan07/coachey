import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      color: Colors.green,
      height: 350.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Text("30 DAYS OF CODING"),
          Row(
            children: [
              Text("01.03.2021 - 30\$"),
              Expanded(
                child: Container(
                  child: Text("Lorem ipsum"),
                  color: Colors.blue,
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
