import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImagePreviewMemory extends StatelessWidget {
  const ImagePreviewMemory({super.key, required this.image});

  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.black54,
              child: Image.memory(
                image,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
