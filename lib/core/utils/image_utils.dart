import 'package:flutter/material.dart';

class ImageUtils {
  /// Returns an ImageProvider based on whether the path is a network URL or a local asset.
  static ImageProvider getImageProvider(String path) {
    if (path.startsWith('http')) {
      return NetworkImage(path);
    } else {
      return AssetImage(path);
    }
  }

  /// Returns an Image widget based on whether the path is a network URL or a local asset.
  static Widget buildImage(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
  }) {
    Widget image;
    if (path.startsWith('http')) {
      image = Image.network(
        path,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 50),
      );
    } else {
      image = Image.asset(
        path,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 50),
      );
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: image,
      );
    }
    return image;
  }
}
