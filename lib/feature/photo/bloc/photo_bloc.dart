import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/repo/i_photo_repo.dart';
part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc(this.photoRepo) : super(PhotoLoading()) {
    on<LoadPhoto>(_load);
  }
  final IPhotoRepo photoRepo;

  Future<void> _load(LoadPhoto event, Emitter<PhotoState> emit) async {
    if (state is! PhotoSuccess) {
      emit(PhotoLoading());
    }

    final photoList = await photoRepo.getListPhoto();

    try {
      emit(PhotoSuccess(photos: photoList));
    } catch (e, st) {
      if (kDebugMode) {
        print(st);
      }
      emit(PhotoError());
    } finally {}
  }
}
