part of 'photo_bloc.dart';

sealed class PhotoState {}

final class PhotoLoading extends PhotoState {}

final class PhotoSuccess extends PhotoState {
  final List<PhotoEntity> photos;

  PhotoSuccess({required this.photos});
}

final class PhotoError extends PhotoState {}
