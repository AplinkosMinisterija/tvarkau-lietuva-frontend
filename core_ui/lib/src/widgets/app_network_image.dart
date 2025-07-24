import 'package:core/utils/loader_widget.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final bool isThumbnailMode;

  const AppNetworkImage({
    required this.url,
    this.fit,
    required this.isThumbnailMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      formatImageUrl(url, isThumbnailMode),
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return LoaderWidget().loader();
      },
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.image_not_supported_outlined),
      fit: fit ?? BoxFit.contain,
    );
  }

  String formatImageUrl(String imageUrl, bool isThumbnail) {
    List<String> slicedUrl = imageUrl.split("upload/");
    return isThumbnail
        ? "${slicedUrl[0]}upload/c_scale,w_300/${slicedUrl[1]}"
        : "${slicedUrl[0]}upload/q_10:420/${slicedUrl[1]}";
  }
}
