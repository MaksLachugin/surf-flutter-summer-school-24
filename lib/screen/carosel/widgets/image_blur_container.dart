import 'dart:ui';
import 'package:flutter/material.dart';

class ImageBlurContainer extends StatelessWidget {
  final String url;

  const ImageBlurContainer({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Image.network(url),
      ),
    );
  }
}
