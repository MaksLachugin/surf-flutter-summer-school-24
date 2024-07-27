import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/repo/models/ya_dir_model/ya_dir_model.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/repo/photo_repo.dart';
import 'package:surf_flutter_summer_school_24/storage/photo_repo/photo_storage.dart';

class YaPhotoRepo implements PhotoRepo {
  final Dio dio = Dio();
  YaPhotoStorage yaPhotoStorage;
  YaPhotoRepo({
    required this.yaPhotoStorage,
  });
  @override
  Future<List<PhotoEntity>> getListPhoto() async {
    List<PhotoEntity> res = [];
    YaDirModel.fromMap((await dio.get(
      'https://cloud-api.yandex.net/v1/disk/resources',
      queryParameters: {
        'path': yaPhotoStorage.path,
        'limit': 50,
      },
      options: Options(
        headers: {
          "Authorization": "OAuth ${yaPhotoStorage.token}",
        },
      ),
    ))
            .data)
        .embedded!
        .items!
        .where(
      (item) {
        return item.mediaType == 'image';
      },
    ).forEach(
      (item) {
        res.add(
          PhotoEntity(
            id: item.path!,
            url: item.file!,
            createdAt: DateTime.parse(item.created!),
            // smallImageUrl: item.preview,
          ),
        );
      },
    );
    return res;
  }

  @override
  Future<void> uploadPhoto(XFile imageFromGallery) async {
    final name = imageFromGallery.name;

    final response = await dio.get(
      "https://cloud-api.yandex.net/v1/disk/resources/upload",
      queryParameters: {'path': '${yaPhotoStorage.path}$name'},
      options: Options(
        headers: {"Authorization": "OAuth ${yaPhotoStorage.token}"},
      ),
    );
    final json = response.data;
    final linkToUpload = json['href'] as String;

    // ### Загружаем файл на сервер

    final file = File(imageFromGallery.path);
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
    });
    await dio.put(linkToUpload, data: formData);
  }

  @override
  Future<void> removePhoto(String path) async {
    var p = path.replaceFirst('disk:', '');

    dio.delete(
      "https://cloud-api.yandex.net/v1/disk/resources/",
      queryParameters: {'path': p},
      options: Options(
        headers: {"Authorization": "OAuth ${yaPhotoStorage.token}"},
      ),
    );
  }
}
