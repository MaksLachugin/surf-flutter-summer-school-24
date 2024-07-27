part of 'photo_bloc.dart';

sealed class PhotoEvent {}

final class LoadPhoto extends PhotoEvent {}

final class UploadPhoto extends PhotoEvent {
  final List<XFile> files;

  UploadPhoto({required this.files});
}

final class StartSelectPhoto extends PhotoEvent {
  final String id;

  StartSelectPhoto({required this.id});
}

final class StopSelectPhoto extends PhotoEvent {}

final class ChangeSelectPhoto extends PhotoEvent {
  final String id;

  ChangeSelectPhoto({required this.id});
}

final class DeleteSelectPhoto extends PhotoEvent {}
