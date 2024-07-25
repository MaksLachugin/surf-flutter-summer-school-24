import 'package:flutter/material.dart';

class ImageBoxViewNetworkWidget extends StatelessWidget {
  final String url;

  const ImageBoxViewNetworkWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      fit: BoxFit.cover,
      url,
      loadingBuilder: (buildContext, widget, imageChunkEvent) {
        if (imageChunkEvent == null) return widget;
        return Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 74, 67, 82),
                    Color.fromARGB(255, 26, 99, 117),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            height: 100.0,
            width: 100.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircularProgressIndicator(
                value: imageChunkEvent.expectedTotalBytes != null
                    ? imageChunkEvent.cumulativeBytesLoaded /
                        imageChunkEvent.expectedTotalBytes!
                    : null,
              ),
            ),
          ),
        );
      },
      errorBuilder: (buildContext, object, stackTrace) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF3366FF),
                  Color(0xFF00CCFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        );
      },
    );
  }
}
