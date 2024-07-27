import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';

abstract interface class PhotoRepo {
  Future<List<PhotoEntity>> getListPhoto();
  Future<void> uploadPhoto(XFile imageFromGallery);
  Future<void> removePhoto(String path);
}
