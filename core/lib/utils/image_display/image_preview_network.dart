import 'package:flutter/material.dart';

class ImagePreviewNetwork extends StatelessWidget {
  const ImagePreviewNetwork({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.black54,
              child: Image.network(
                imageUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
