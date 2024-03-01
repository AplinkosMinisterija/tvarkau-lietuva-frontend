import 'package:flutter/material.dart';
import 'image_preview.dart';

class AppImageDisplay {
  static final AppImageDisplay _instance = AppImageDisplay._();

  AppImageDisplay._();

  factory AppImageDisplay() => _instance;

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
                          ImagePreview(imageUrl: image),
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
}
