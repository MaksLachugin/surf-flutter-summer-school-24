import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_controller.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_page.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_state.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/Image_box_view.dart';

class GridScreenBody extends StatelessWidget {
  const GridScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            height: 750,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
                crossAxisCount: 3,
              ),
              itemBuilder: (buildContext, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          var corouselController = CorouselController();
                          corouselController.setCarouselState(
                              CarouselState(max: 4, current: index));
                          return CarouselPage(
                            corouselController: corouselController,
                          );
                        },
                      ),
                    );
                  },
                  child: ImageBoxView(
                    index: index,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
