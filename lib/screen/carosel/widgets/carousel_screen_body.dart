import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:surf_flutter_summer_school_24/feature/carousel/cubit/carousel_cubit.dart';

import 'image_blur_container.dart';
import 'image_container.dart';
import 'indicators_widget.dart';

class CarouselScreenBody extends StatefulWidget {
  const CarouselScreenBody({
    super.key,
  });

  @override
  State<CarouselScreenBody> createState() => _CarouselScreenBodyState();
}

class _CarouselScreenBodyState extends State<CarouselScreenBody> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _pageController = PageController(
        viewportFraction: 0.9,
        initialPage: BlocProvider.of<CarouselCubit>(context).state.current);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselCubit, CarouselState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 700,
              child: PageView.builder(
                itemCount: state.photos.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: setActivePage,
                itemBuilder: (context, pagePosition) {
                  var photoUrl = state.photos[pagePosition].url;
                  if (pagePosition == state.current) {
                    return ImageContainer(url: photoUrl);
                  } else {
                    return ImageBlurContainer(url: photoUrl);
                  }
                },
              ),
            ),
            IndicatorsWidget(setter: setter),
          ],
        );
      },
    );
  }

  void setter(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void setActivePage(int value) {
    BlocProvider.of<CarouselCubit>(context).swipe(value);
  }
}
