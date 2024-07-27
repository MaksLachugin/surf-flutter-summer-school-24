import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/repo/photo_repo.dart';
part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepo photoRepo;

  PhotoBloc(this.photoRepo) : super(PhotoLoading()) {
    on<UploadPhoto>(_upload);
    on<StartSelectPhoto>(_startSelectPhoto);
    on<StopSelectPhoto>(_stopSelectPhoto);
    on<ChangeSelectPhoto>(_changeSelectPhoto);
    on<DeleteSelectPhoto>(_deleteSelectPhoto);
    on<LoadPhoto>(_load);
  }
  Future<void> _startSelectPhoto(
      StartSelectPhoto event, Emitter<PhotoState> emit) async {
    if (state is PhotoSuccess) {
      emit(PhotoSelector(
          selectedId: [event.id], photos: (state as PhotoSuccess).photos));
    } else {
      emit(PhotoError());
    }
  }

  Future<void> _stopSelectPhoto(
      StopSelectPhoto event, Emitter<PhotoState> emit) async {
    if (state is PhotoSelector) {
      emit(PhotoSuccess(photos: (state as PhotoSelector).photos));
    } else {
      emit(PhotoError());
    }
  }

  Future<void> _deleteSelectPhoto(
      DeleteSelectPhoto event, Emitter<PhotoState> emit) async {
    if (state is PhotoSelector) {
      List<PhotoEntity> photos = [];
      if (state is PhotoSelector) photos = (state as PhotoSelector).photos;
      List<String> selected = (state as PhotoSelector).selectedId;
      for (var element in selected) {
        await photoRepo.removePhoto(element);
        photos.removeWhere((p) {
          return p.id == element;
        });
      }
      emit(PhotoSuccess(photos: photos));
    } else {
      emit(PhotoError());
    }
  }

  Future<void> _changeSelectPhoto(
      ChangeSelectPhoto event, Emitter<PhotoState> emit) async {
    if (state is PhotoSelector) {
      List<String> selected = List.of((state as PhotoSelector).selectedId);
      String id = event.id;
      if (selected.contains(id)) {
        selected.remove(id);
      } else {
        selected.add(id);
      }
      emit(PhotoSelector(
          selectedId: selected, photos: (state as PhotoSelector).photos));
    } else {
      emit(PhotoError());
    }
  }

  Future<void> _upload(UploadPhoto event, Emitter<PhotoState> emit) async {
    final imagesFromGallery = event.files;
    if (event.files.isEmpty) return;

    for (var imageFromGallery in imagesFromGallery) {
      await photoRepo.uploadPhoto(imageFromGallery);
    }

    await _load(event, emit);
  }

  Future<void> _load(PhotoEvent event, Emitter<PhotoState> emit) async {
    if (state is! PhotoSuccess) {
      emit(PhotoLoading());
    }
    List<PhotoEntity> photos = [];
    if (state is PhotoSelector) photos = (state as PhotoSelector).photos;
    var serverPhoto = await photoRepo.getListPhoto();
    photos.removeWhere((element) {
      return !serverPhoto.contains(element);
    }); // Удаляем все фото, которые исчезли после предыдущего получения

    serverPhoto.removeWhere((element) {
      return photos.contains(element);
    }); // Удаляем все фото, которые уже есть
    photos.addAll(serverPhoto);

    try {
      emit(PhotoSuccess(photos: photos));
    } catch (e, st) {
      if (kDebugMode) {
        print(e);
        print(st);
      }
      emit(PhotoError());
    } finally {}
  }
}
