import 'package:flutter/foundation.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_state.dart';

class CorouselController {
  late final ValueNotifier<CarouselState> _carouselState =
      ValueNotifier<CarouselState>(CarouselState(max: 1, current: 1));

  ValueListenable<CarouselState> get carouselState => _carouselState;

  Future<void> setCarouselState(CarouselState carouselState) async {
    if (carouselState == _carouselState.value) return;
    _carouselState.value = carouselState;
  }
}
