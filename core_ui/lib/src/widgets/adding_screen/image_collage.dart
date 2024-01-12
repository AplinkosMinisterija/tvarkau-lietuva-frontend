import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImageCollage extends StatelessWidget {
  const ImageCollage({
    super.key,
    required this.width,
    required this.imageBytes,
  });

  final double width;
  final List<Uint8List> imageBytes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.208,
      height: width * 0.2,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 1,
      )),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        children: getImageWidgets(imageBytes),
      ),
    );
  }
}

List<Widget> getImageWidgets(List<Uint8List> imageByte) {
  return imageByte.map(Image.memory).toList();
}
