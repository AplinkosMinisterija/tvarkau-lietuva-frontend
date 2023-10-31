import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImageCollageMobile extends StatefulWidget {
  const ImageCollageMobile({
    required this.width,
    required this.imageBytes,
    this.onTap,
  });

  final double width;
  final List<Uint8List> imageBytes;
  final Function(int index)? onTap;

  @override
  State<ImageCollageMobile> createState() => _ImageCollageMobileState();
}

class _ImageCollageMobileState extends State<ImageCollageMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * 0.9111,
      height: widget.imageBytes.length > 2
          ? widget.width * 0.9111
          : widget.width * 0.4555,
      child: AlignedGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemBuilder: (context, index) {
          return Stack(alignment: Alignment.topRight, children: [
            getImageWidget(widget.imageBytes, widget.width * 0.4333)[index],
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 5),
              child: GestureDetector(
                onTap: widget.onTap != null ? widget.onTap!(index) : null,
                child: Icon(
                  Icons.remove_circle_outline_outlined,
                  color: Colors.white,
                  size: widget.width * 0.05,
                ),
              ),
            )
          ]);
        },
        itemCount:
            getImageWidget(widget.imageBytes, widget.width * 0.4333).length,
      ),
    );
  }
}

List<Widget> getImageWidget(List<Uint8List> imageByte, double dimensions) {
  List<Image> imageList = [];
  imageByte.forEach((element) {
    imageList.add(Image.memory(
      element,
      height: dimensions,
      width: dimensions,
      fit: BoxFit.fill,
    ));
  });
  return imageList;
}
