import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBoxViewNetworkWidget extends StatelessWidget {
  final String url;

  const ImageBoxViewNetworkWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CachedImage(
      url: url,
      boxFit: BoxFit.cover,
    );
  }
}

class CachedImage extends StatelessWidget {
  final String url;

  final BoxFit? boxFit;

  const CachedImage({
    super.key,
    required this.url,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.grey, Colors.blueGrey],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.repeated,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
