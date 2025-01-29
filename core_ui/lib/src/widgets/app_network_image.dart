import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;

  const AppNetworkImage({
    required this.url,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final imageProvider = CachedNetworkImageProvider(
      url,
      cacheKey: url,
    );
    return CachedNetworkImage(
      memCacheWidth: 45,
      memCacheHeight: 60,
      maxHeightDiskCache: 60,
      maxWidthDiskCache: 45,
      imageUrl: url,
      imageBuilder: (context, imageProv) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.contain,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromRGBO(0, 0, 0, 1),
              width: 1,
            )),
        child: LoadingAnimationWidget.fourRotatingDots(
          color: const Color.fromRGBO(57, 97, 84, 1),
          size: 50,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
