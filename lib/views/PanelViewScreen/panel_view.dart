import 'dart:developer';
import 'package:coach_finder/data/data.dart';
import 'package:coach_finder/views/PanelViewScreen/widgets/coach_card.dart';
import 'package:flutter/material.dart';

import '../../models/expanded_panel.dart';

class DetailedPanel extends StatefulWidget {
  const DetailedPanel({Key? key, required this.model}) : super(key: key);

  final ExpandedModel model;

  @override
  _DetailedPanelState createState() => _DetailedPanelState();
}

class _DetailedPanelState extends State<DetailedPanel>
    with SingleTickerProviderStateMixin {


  // the controller of the slide animation of the list view items 
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );


    // forward the animation
    animationController.forward();
  }

  @override
  void dispose() {

    // dispose the animation controller for avoiding memory leaks 
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("DETAILED PANEL BUILDED");

    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: "BOX_COLOR_TRANSITION${widget.model.title}",
          child: Material(
            color: widget.model.color,
            child: DefaultTextStyle(
              style: TextStyle(
                fontFamily: "LuckiestGuy",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 45.0,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 150.0,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.arrow_back_outlined,
                              color: widget.model.textColor),
                          splashRadius: 25.0,
                        ),
                      ),
                      FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: Column(
                            children: [
                              
                              Row(
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
                                        height: 2.5,
                                        fontSize: 20.0,
                                        color: widget.model.textColor
                                            .withOpacity(0.5)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 150.0,
          child: Material(
            color: Colors.transparent,
            child:DefaultTextStyle(
              style: TextStyle(
                fontFamily: "LuckiestGuy",
                color: Colors.white,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                ),
              child: GridView.builder(
                itemCount: MyData.coaches.length,
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
                    coachModel: MyData.coaches[__],
                    animation: __ < 6
                        ? animationController.view
                        : AlwaysStoppedAnimation(1.0),
                  );
                }),)
          ),
        )
      ],
    );
  }
}
