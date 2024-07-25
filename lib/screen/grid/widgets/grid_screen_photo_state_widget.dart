import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_page.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/image_box_view.dart';

class GridImageSuccessWidget extends StatelessWidget {
  const GridImageSuccessWidget({
    super.key,
    required this.photos,
  });
  final List<PhotoEntity> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 2,
        crossAxisCount: 3,
      ),
      itemCount: photos.length,
      itemBuilder: (buildContext, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CarouselPage(
                    photos: photos,
                    current: index,
                  );
                },
              ),
            );
          },
          child: ImageBoxViewNetworkWidget(url: photos[index].url),
        );
      },
    );
  }
}

class GridImageLoadingWidget extends StatelessWidget {
  const GridImageLoadingWidget({
    super.key,
    required this.count,
  });

  final int count;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 2,
        crossAxisCount: 3,
      ),
      itemCount: count,
      itemBuilder: (buildContext, index) {
        return InkWell(
          onTap: () {},
          child: const ImageBoxViewNetworkWidget(url: ""),
        );
      },
    );
  }
}
