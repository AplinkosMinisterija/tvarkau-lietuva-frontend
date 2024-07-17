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
    required bool titlesEnabled,
    List<String>? titles,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: width,
        child: GridView.count(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          shrinkWrap: true,
          childAspectRatio: titlesEnabled ? 0.82 : 1,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: [
            for (var i = 0; i < imageUrls.length; i++) ...[
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ImagePreviewNetwork(
                            imageUrls: imageUrls, activeImageIndex: i);
                      });
                },
                child: titlesEnabled
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.zoomIn,
                                child: Image.network(
                                  imageUrls[i],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            titles?[i] ?? '',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.zoomIn,
                            child: Image.network(
                              imageUrls[i],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
              ),
            ]
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
              child: MouseRegion(
                cursor: SystemMouseCursors.zoomIn,
                child: Image.memory(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 5),
          child: IconButton(
            onPressed: () {
              onRemoveTap();
            },
            iconSize: 24,
            icon: const Icon(
              Icons.remove_circle_outline_outlined,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
