import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';

abstract interface class IPhotoRepo {
  Future<List<PhotoEntity>> getListPhoto();
}
