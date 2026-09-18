import 'dart:convert';
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

  static const _needsRasterizing = {
    // Documents
    'pdf', 'doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx',
    // Vectors
    'svg', 'ai', 'eps', 'psd',
    // Raw formats
    'cr2', 'nef', 'arw', 'dng', 'raw',
    // No Flutter support
    'tif', 'tiff', 'heic', 'heif', 'avif', 'ico',
  };

  static const _neverRender = {
    'zip',
    'rar',
    '7z',
    'txt',
    'csv',
    'json',
    'mp3',
    'wav',
    'exe',
  };

  @override
  Widget build(BuildContext context) {
    final trimmed = url.trim();

    if (trimmed.isEmpty) {
      return const Icon(Icons.image_not_supported_outlined);
    }

    if (trimmed.startsWith('data:image')) {
      try {
        final base64Part = trimmed.split(',').last;
        return Image.memory(
          base64Decode(base64Part),
          fit: fit ?? BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image_not_supported_outlined),
        );
      } catch (_) {
        return const Icon(Icons.image_not_supported_outlined);
      }
    }

    final ext = _extractExtension(trimmed);
    if (_neverRender.contains(ext)) {
      return const Icon(Icons.image_not_supported_outlined);
    }

    return Image.network(
      formatImageUrl(trimmed, isThumbnailMode),
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return LoaderWidget().loader();
      },
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.image_not_supported_outlined),
      fit: fit ?? BoxFit.contain,
      cacheWidth: isThumbnailMode ? 300 : null,
    );
  }

  String formatImageUrl(String imageUrl, bool isThumbnail) {
    final uploadIndex = imageUrl.indexOf('upload/');
    if (uploadIndex == -1) {
      return imageUrl;
    }

    final base = imageUrl.substring(0, uploadIndex + 'upload/'.length);
    var path = imageUrl.substring(uploadIndex + 'upload/'.length);

    final ext = _extractExtension(imageUrl);
    if (_needsRasterizing.contains(ext)) {
      final dot = path.lastIndexOf('.');
      final slash = path.lastIndexOf('/');
      path = dot > slash ? '${path.substring(0, dot)}.jpg' : '$path.jpg';
    }

    return isThumbnail ? "${base}c_scale,w_300/$path" : "${base}q_10:420/$path";
  }

  String _extractExtension(String rawUrl) {
    final path = Uri.tryParse(rawUrl)?.path ?? rawUrl;
    final dot = path.lastIndexOf('.');
    final slash = path.lastIndexOf('/');
    if (dot == -1 || dot < slash) return '';
    return path.substring(dot + 1).toLowerCase();
  }
}
