import 'package:flutter/foundation.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_state.dart';

class CorouselController {
  late final ValueNotifier<CarouselState> _state =
      ValueNotifier<CarouselState>(CarouselState(max: 1, current: 1));

  ValueListenable<CarouselState> get state => _state;

  Future<void> setState(CarouselState s) async {
    if (s == _state.value) return;
    _state.value = s;
  }
}
