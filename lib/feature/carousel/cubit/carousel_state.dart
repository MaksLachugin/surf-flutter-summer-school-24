part of 'carousel_cubit.dart';

class CarouselState {
  final int current;
  int get max => photos.length;
  final List<PhotoEntity> photos;

  CarouselState({required this.current, required this.photos});

  PhotoEntity getCurrentPhoto() {
    return photos[current];
  }

  CarouselState copyWith({
    int? current,
    List<PhotoEntity>? photos,
  }) {
    return CarouselState(
      current: current ?? this.current,
      photos: photos ?? this.photos,
    );
  }
}
