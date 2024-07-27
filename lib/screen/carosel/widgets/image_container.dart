import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/image_box_view.dart';

class ImageContainer extends StatelessWidget {
  final String url;

  const ImageContainer({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: CachedImage(
        url: url,
      ),
    );
  }
}
