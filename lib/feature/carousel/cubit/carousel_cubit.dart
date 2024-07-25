import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';

part 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselState(photos: [], current: 0));

  void swipe(int page) {
    emit(state.copyWith(current: page));
  }

  void buildState(List<PhotoEntity> photos, int current) {
    emit(CarouselState(current: current, photos: photos));
  }
}
