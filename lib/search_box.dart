import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as f;

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 55.0,
            decoration: BoxDecoration(
                color: Color(0xff2843ed).withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            padding: EdgeInsets.all(15.0),
            child: Text("Enter topic , trainer, or keywords",
                style: f.GoogleFonts.spaceGrotesk()
                    .copyWith(fontSize: 20.0, fontWeight: FontWeight.w100)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xff2843ed), width: 2.0)),
              child: Icon(
                Icons.search,
                color: Color(0xff2843ed),
              ),
            ),
          )
        ],
      ),
    );
  }
}
