import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_controller.dart';

class CarouselInherited extends InheritedWidget {
  const CarouselInherited(
      {super.key, required this.child, required this.corouselController})
      : super(child: child);

  final Widget child;
  final CorouselController corouselController;

  static CorouselController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CarouselInherited>()
        ?.corouselController;
  }

  static CorouselController of(BuildContext context) {
    final CorouselController? result = maybeOf(context);
    assert(result != null, 'No MyThemeInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CarouselInherited oldWidget) => false;
}
