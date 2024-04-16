import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'image_preview_memory.dart';
import 'image_preview_network.dart';

class ImageGallery {
  static final ImageGallery _instance = ImageGallery._();

  ImageGallery._();

  factory ImageGallery() => _instance;

  Padding buildImages({
    required List<String> imageUrls,
    required BuildContext context,
    required double width,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: width,
        child: GridView.count(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: [
            for (final image in imageUrls)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) =>
                          ImagePreviewNetwork(imageUrl: image),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Stack buildPickerImage({
    required Uint8List image,
    required BuildContext context,
    required double width,
    required VoidCallback onRemoveTap,
  }) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, __, ___) => ImagePreviewMemory(image: image),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.memory(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 5),
          child: GestureDetector(
            onTap: () {
              onRemoveTap();
            },
            child: Icon(
              Icons.remove_circle_outline_outlined,
              color: Colors.white,
              size: width / 2.4 * 0.05,
            ),
          ),
        )
      ],
    );
  }
}
