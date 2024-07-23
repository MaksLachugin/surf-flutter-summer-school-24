import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/widgets/carousel_inherited.dart';

class CarouselScreenBody extends StatefulWidget {
  const CarouselScreenBody({
    super.key,
  });

  @override
  State<CarouselScreenBody> createState() => _CarouselScreenBodyState();
}

class _CarouselScreenBodyState extends State<CarouselScreenBody> {
  List<String> images = [
    'https://c4.wallpaperflare.com/wallpaper/586/603/742/minimalism-4k-for-mac-desktop-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/448/174/357/neon-4k-hd-best-for-desktop-wallpaper-preview.jpg',
    '',
    ""
  ];
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 0);
  }

  int _activePage = 0;

  get activePage => _activePage;
  void setActivePage(int page) {
    _activePage = page;
    CarouselInherited.of(context).setState(CarouselInherited.of(context)
        .state
        .value
        .copyWith(max: images.length, current: activePage + 1));
  }

  @override
  Widget build(BuildContext context) {
    CarouselInherited.of(context).setState(CarouselInherited.of(context)
        .state
        .value
        .copyWith(max: images.length, current: activePage + 1));
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: Stack(
            children: [
              PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      setActivePage(page);
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Transform.scale(
                        scale: (pagePosition == activePage) ? 1 : 0.9,
                        child: Image.asset(
                          'assets/images/$pagePosition.jpg',
                        ),
                      ),
                    );
                  }),
              Positioned(
                width: 50,
                height: 500,
                top: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 2, // mess with this to update blur
                        sigmaY: 2),
                    child: Container(),
                  ),
                ),
              ),
              Positioned(
                width: 50,
                height: 500,
                top: 0,
                right: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 2, // mess with this to update blur
                        sigmaY: 2),
                    child: Container(),
                  ),
                ),
              ),
            ],
          ),
        ),
        pips(),
      ],
    );
  }

  Row pips() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators(images.length, activePage, (int index) {
          setState(() {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 250),
              curve: Curves.ease,
            );
          });
        }));
  }
}

List<Widget> indicators(
    imagesLength, currentIndex, void Function(int index) setter) {
  return List<Widget>.generate(imagesLength, (index) {
    return GestureDetector(
      onTap: () {
        setter(index);
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      ),
    );
  });
}
