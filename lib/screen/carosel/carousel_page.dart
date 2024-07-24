import 'package:flutter/material.dart';

import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_controller.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_state.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/widgets/carousel_inherited.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/widgets/carousel_screen_body.dart';

class CarouselPage extends StatelessWidget {
  final CorouselController corouselController;

  const CarouselPage({
    super.key,
    required this.corouselController,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselInherited(
      corouselController: corouselController,
      child: const Scaffold(
        appBar: CarouselAppBar(),
        body: CarouselScreenBody(),
      ),
    );
  }
}

class CarouselAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CarouselAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
      title: const Text("22.07.24"),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder<CarouselState>(
            valueListenable: CarouselInherited.of(context).carouselState,
            builder:
                (BuildContext context, CarouselState value, Widget? child) {
              return Text(
                "${value.current}/${value.max}",
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
