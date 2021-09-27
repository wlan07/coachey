import 'package:coach_finder/views/CoachScreen/widgets/coach_stacked_panels.dart';
import 'package:flutter/material.dart';

import '../../models/coach_model.dart';

class CoachDetails extends StatefulWidget {
  CoachDetails({Key? key, required this.coachModel, required this.tag})
      : super(key: key);

  final CoachModel coachModel;
  final String tag;

  @override
  _CoachDetailsState createState() => _CoachDetailsState();
}

class _CoachDetailsState extends State<CoachDetails> {
  
  late ValueNotifier<Animation<Alignment>> imageSlideAnimation;

  @override
  void initState() {
    super.initState();

    imageSlideAnimation = ValueNotifier<Animation<Alignment>>(
        AlwaysStoppedAnimation(Alignment.bottomCenter));
  }

  void _initImageSlideAnimation(Animation<double> c) {
    imageSlideAnimation.value = c.drive(AlignmentTween(
        begin: Alignment.topCenter, end: Alignment.bottomCenter));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xff1f1edb),
        child: DefaultTextStyle(
          style: TextStyle(
            fontFamily: "LuckiestGuy",
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 35.0,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.4,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Hero(
                      tag: widget.tag,
                      child: ValueListenableBuilder(
                        valueListenable: imageSlideAnimation,
                        builder: (BuildContext context,
                            Animation<Alignment> value, Widget? child) {
                          return AnimatedBuilder(
                              animation: value,
                              builder: (_, __) {
                                return Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          alignment: value.value,
                                          image: Image.asset(
                                                  widget.coachModel.imageUrl)
                                              .image)),
                                );
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          height: 50.0,
                          width: 50.0,
                          child: Icon(Icons.arrow_back_outlined,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FractionallySizedBox(
                  heightFactor: 0.9,
                  alignment: Alignment.bottomCenter,
                  child: CoachStackedPanels(
                    initImageSlideAnimation: _initImageSlideAnimation,
                  ))
            ],
          ),
        ));
  }
}
