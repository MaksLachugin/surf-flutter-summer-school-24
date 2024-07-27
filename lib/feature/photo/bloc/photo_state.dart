part of 'photo_bloc.dart';

sealed class PhotoState extends Equatable {}

final class PhotoLoading extends PhotoState {
  @override
  List<Object?> get props => [];
}

final class PhotoSuccess extends PhotoState {
  final List<PhotoEntity> photos;

  PhotoSuccess({required this.photos});

  @override
  List<Object?> get props => [photos];
}

final class PhotoError extends PhotoState {
  @override
  List<Object?> get props => [];
}

final class PhotoSelector extends PhotoState {
  final List<PhotoEntity> photos;
  final List<String> selectedId;

  PhotoSelector({required this.selectedId, required this.photos});

  @override
  List<Object?> get props => [photos, selectedId];
}
