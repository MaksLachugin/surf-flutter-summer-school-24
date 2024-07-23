import 'package:flutter/material.dart';

class ImageBoxView extends StatelessWidget {
  final int index;

  const ImageBoxView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      fit: BoxFit.cover,
      'assets/images/${index % 5}.jpg',
      errorBuilder: (buildContext, object, stackTrace) {
        return const Center(
          child: SizedBox(
            height: 50.0,
            width: 50.0,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
