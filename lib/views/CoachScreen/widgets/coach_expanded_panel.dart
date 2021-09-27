import 'dart:math';

import 'package:coach_finder/views/CoachScreen/widgets/available_challenges.dart';
import 'package:coach_finder/views/CoachScreen/widgets/coach_about_details.dart';
import 'package:coach_finder/views/CoachScreen/widgets/straggered_photos.dart';
import 'package:flutter/material.dart';

class CoachExpandedPanel extends StatefulWidget {
  
  const CoachExpandedPanel(
      {Key? key,
      required this.index,
      required this.topmargin,
      required this.bottomMargin,
      required this.animation,
      required this.offsets,
      required this.onSlideUp,
      required this.headerHeight})
      : super(key: key);

  final int index;
  final Function onSlideUp;
  final ValueNotifier<List<Offset>> offsets;
  final Animation<double> animation;
  final double headerHeight;
  final double topmargin;
  final double bottomMargin;

  @override
  _CoachExpandedPanelState createState() => _CoachExpandedPanelState();
}

class _CoachExpandedPanelState extends State<CoachExpandedPanel> {
  Offset get _getOffset => widget.offsets.value[widget.index];

  late List<bool> _panelsStatus;

  static const List<Color> _colors = [
    Colors.white,
    Color(0xff1f1edb),
    Color(0xff080517),
  ];

  Animation<double> get animation => widget.animation;

  late List<Widget> _headers;
  Widget get _getBody {
    switch (widget.index) {
      case 1:
        return DefaultTextStyle(
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(color: Colors.white),
            child: const AvailableChallenge());
      case 2:
        return const StraggredPhotos();
      default:
        return const CoachAboutDetails();
    }
  }

  @override
  void initState() {
    super.initState();
    _headers = [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lorem Ipsum"),
                Text(
                    "Lorem",
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.6),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: animation,
              child: Icon(
                Icons.arrow_upward_outlined,
                size: 15,
                color: Colors.blue.withOpacity(0.6),
              ),
              builder: (BuildContext context, Widget? child) {
                return Row(
                  children: [
                    Text(
                      _panelsStatus[widget.index] ? "Show less" : "Show more",
                      style: TextStyle(
                          color: Colors.blue.withOpacity(0.6),
                          fontSize: 20.0,
                          fontFamily: "Space",
                          fontWeight: FontWeight.w600),
                    ),
                    Transform(
                      transform: Matrix4.identity()
                        ..rotateX(-0 * pi * animation.value / 180.0),
                      child: child!,
                      origin: Offset.zero,
                      alignment: Alignment.center,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            "Available challenges",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          Spacer(),
          Text(
            "/03",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
        ],
      ),
      Row(
        children: [
          Text("Photos", style: TextStyle(fontSize: 22, color: Colors.white)),
          Spacer(),
          Text(
            "/15",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
        ],
      )
    ];
    _panelsStatus = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (_, __) {
        return Transform.translate(
            child: __, offset: _getOffset * widget.animation.value);
      },
      child: GestureDetector(
        onVerticalDragStart: (_) {
          widget.onSlideUp(widget.index, _panelsStatus);
          _panelsStatus[widget.index] = !_panelsStatus[widget.index];
        },
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: widget.topmargin,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  height: widget.headerHeight,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15.0, right: 25.0),
                  child: _headers[widget.index]),
              Expanded(child: _getBody),
              SizedBox(
                height: widget.bottomMargin,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: _colors[widget.index],
              borderRadius: BorderRadius.only(topRight: Radius.circular(70.0))),
        ),
      ),
    );
  }
}
