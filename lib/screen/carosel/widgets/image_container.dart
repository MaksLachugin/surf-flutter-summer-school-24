import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String url;

  const ImageContainer({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Image.network(url),
    );
  }
}
