import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StraggredPhotos extends StatelessWidget {
  const StraggredPhotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 4,
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                image: Image.asset(
                        "assets/images/image.jpg")
                    .image)),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.count(
          2,
          index % 3 == 0
              ? 2
              : index % 2 == 0
                  ? 4
                  : 3),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}
