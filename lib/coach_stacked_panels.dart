import 'dart:developer';
import 'package:coach_finder/coach_expanded_panel.dart';
import 'package:flutter/material.dart';

class CoachStackedPanels extends StatefulWidget {
  const CoachStackedPanels({Key? key, required this.initImageSlideAnimation})
      : super(key: key);

  final Function initImageSlideAnimation;

  @override
  _CoachStackedPanelsState createState() => _CoachStackedPanelsState();
}

class _CoachStackedPanelsState extends State<CoachStackedPanels>
    with TickerProviderStateMixin {
  List<double> _getInitialTopMargin(double height) {
    _height = height;

    return [height * 0.2, height * 0.35, height * 0.55];
  }

  static const List<double> bottomMarginFactor = [0.2, 0.1, 0.09];

  List<double> _getHeadersHeight(double height) {
    return [height * 0.12, height * 0.1, height * 0.1];
  }

  late double _height;

  late AnimationController translateanimationController;
  late AnimationController slideAnimationController;

  late Animation<double> translateAnimation;
  late Animation<double> slideAnimation;

  late ValueNotifier<List<Offset>> _offsetsToSlideToNotifier;

  @override
  void initState() {
    super.initState();

    _offsetsToSlideToNotifier = ValueNotifier<List<Offset>>(
        List.generate(3, (index) => Offset(0.0, 0.0)));

    translateanimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    slideAnimationController = AnimationController(
        reverseDuration: const Duration(milliseconds: 600),
        vsync: this,
        duration: const Duration(milliseconds: 800));

    slideAnimation = CurvedAnimation(
        parent: slideAnimationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.decelerate);

    widget.initImageSlideAnimation(slideAnimation);

    translateAnimation = CurvedAnimation(
        parent: translateanimationController, curve: Curves.decelerate);

    translateanimationController.forward();
  }

  void _onSlideUp(int index, List<bool> _) {
    log(_.toString());

    // IF THE CURRENT PANEL TO ANIMATE NOT OPENED
    if (!_[index]) {
      slideAnimationController.reset();
    }

    if (index == 0) {
      _offsetsToSlideToNotifier.value = [
        Offset(0.0, -_height * 0.2),
        Offset(0.0, _height * 0.45),
        Offset(0.0, _height * 0.35)
      ];
    } else if (index == 1) {
      _offsetsToSlideToNotifier.value = [
        Offset(0.0, -_height * 0.2),
        Offset(0.0, -_height * 0.33),
        Offset(0.0, _height * 0.35)
      ];
    } else {
      _offsetsToSlideToNotifier.value = [
        Offset(0.0, -_height * 0.2),
        Offset(0.0, -_height * 0.33),
        Offset(0.0, -_height * 0.51)
      ];
    }
    if (!_[index]) {
      slideAnimationController.forward();
    } else {
      slideAnimationController.reverse();
    }
  }

  @override
  void dispose() {
    translateanimationController.dispose();
    slideAnimationController.dispose();
    super.dispose();
  }

  final List<Offset> _initialOffsets = [
    Offset(-20.0, 50.0),
    Offset(-50.0, 75.0),
    Offset(-80.0, 100.0)
  ];

  @override
  Widget build(BuildContext context) {
    log("**************CoachStackedPanels BUILDED**************");

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final _initialTopMargin = _getInitialTopMargin(constraints.maxHeight);
        final _headersHeight = _getHeadersHeight(constraints.maxHeight);
        return Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            ...List.generate(3, (index) {
              final offset = _initialOffsets[index];
              return Positioned.fill(
                  top: _initialTopMargin[index],
                  bottom: -_initialTopMargin[index],
                  child: AnimatedBuilder(
                      animation: translateAnimation,
                      builder: (_, __) {
                        return Transform.translate(
                          offset: offset * (1 - translateAnimation.value),
                          child: __,
                        );
                      },
                      child: CoachExpandedPanel(
                        topmargin: constraints.maxHeight * 0.02,
                        bottomMargin: _height * bottomMarginFactor[index],
                        headerHeight: _headersHeight[index],
                        onSlideUp: _onSlideUp,
                        offsets: _offsetsToSlideToNotifier,
                        index: index,
                        animation: slideAnimation,
                      )));
            })
          ],
        );
      },
    );
  }
}
