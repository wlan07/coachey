import 'package:coach_finder/views/PanelViewScreen/panel_view.dart';
import 'package:flutter/material.dart';

import '../../../models/expanded_panel.dart';

class ExpandedPanel extends StatelessWidget {
  const ExpandedPanel({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ExpandedModel model;

  void _onSlide(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
        reverseTransitionDuration: const Duration(milliseconds: 400),
        transitionDuration: const Duration(milliseconds: 500),
        opaque: false,
        pageBuilder: (_, __, ___) {
          return FadeTransition(
            opacity: __,
            child: DetailedPanel(
              model: model,
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {

    return FractionallySizedBox(
      alignment: model.alignment,
      widthFactor: 0.8,
      child: GestureDetector(
        onVerticalDragStart: (_) {
          _onSlide(context);
        },
        child: Hero(
          tag: "BOX_COLOR_TRANSITION${model.title}",
          child: Material(
            color: Colors.transparent,
            child: DefaultTextStyle(
              style: TextStyle(
                fontFamily: "LuckiestGuy",
                color: Colors.white,
                fontSize: 22.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        model.alignment == Alignment.centerRight ? 40.0 : 40,
                    vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          model.alignment == Alignment.centerLeft ? 0.0 : 60.0),
                      topRight: Radius.circular(
                          model.alignment == Alignment.centerRight
                              ? 0.0
                              : 60.0)),
                  color: model.color,
                ),
                height: 500.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                          color: model.textColor,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "/${model.trailing}",
                      style: TextStyle(
                          fontSize: 20.0,
                          height: 1.1,
                          color: model.textColor.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
