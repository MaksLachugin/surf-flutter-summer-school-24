import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_controller.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_page.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/widgets/carousel_inherited.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/Image_box_view.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/ups_widget.dart';

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
            child: GridView.count(
              mainAxisSpacing: 5,
              crossAxisSpacing: 2,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(
                100,
                (index) {
                  return InkWell(
                    onTap: () {
                      if (index % 5 == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpsWidget(),
                            ));
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarouselInherited(
                                  corouselController: CorouselController(),
                                  child: const CarouselPage(),
                                )),
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
        ),
      ],
    );
  }
}
