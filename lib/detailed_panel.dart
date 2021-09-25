import 'dart:developer';

import 'package:coach_finder/coach_card.dart';
import 'package:coach_finder/stacked_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as f;

const String IMAGEUrl =
    "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc5OTk2ODUyMTMxNzM0ODcy/gettyimages-1229892983-square.jpg";

class DetailedPanel extends StatefulWidget {
  const DetailedPanel({Key? key, required this.model}) : super(key: key);

  final ExpandedModel model;

  @override
  _DetailedPanelState createState() => _DetailedPanelState();
}

class _DetailedPanelState extends State<DetailedPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("DETAILED PANEL BUILDED");

    return Hero(
      tag: "BOX_COLOR_TRANSITION${widget.model.title}",
      child: Material(
        color: widget.model.color,
        child: DefaultTextStyle(
          style: f.GoogleFonts.bebasNeue().copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 60.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back_outlined),
                  splashRadius: 25.0,
                ),
              ),
              FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        widget.model.title,
                        style: TextStyle(color: widget.model.textColor),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "/${widget.model.trailing}",
                        style: TextStyle(
                            height: 3.0,
                            fontSize: 20.0,
                            color: widget.model.textColor.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: 20,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisExtent: 250.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (_, __) {
                        return CoachCard(
                          index: __,
                          color: widget.model.textColor,
                          coachModel: CoachModel(
                              imageUrl: IMAGEUrl,
                              fullName: "Elon Musk",
                              fieldName: "Psychologist",
                              nbChallenge: 3),
                          animation: __ < 6
                              ? animationController.view
                              : AlwaysStoppedAnimation(1.0),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
