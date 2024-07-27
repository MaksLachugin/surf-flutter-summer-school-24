import 'package:surf_flutter_summer_school_24/feature/photo/repo/ya_photo_repo.dart';
import 'package:surf_flutter_summer_school_24/storage/photo_repo/my_ya_photo_storage.dart';
import 'package:test/test.dart';

void main() {
  //Тесты мемные
  test('Get sum of array - success', () async {
    var y = YaPhotoRepo(yaPhotoStorage: MyYaPhotoStorage());

    var actualValue = await y.getListPhoto();
    expect(
        'https://downloader.disk.yandex.ru/disk/51164c868edc6671be4dffb05972ade2eccde7b072e4b956da7222f8f4439932/66a26731/nFtImRKHsZpO0msLp_4xrybBOY7hiedTSjOgiBNaTAM-3dgrzYM8oe0ybno9OO6BMCGArHGyRXYwA6gvXoLWmw%3D%3D?uid=245405804&filename=1.jpg&disposition=attachment&hash=&limit=0&content_type=image%2Fjpeg&owner_uid=245405804&fsize=15733&hid=c1f3a6e6bb0c8d2e01bb536c672887cd&media_type=image&tknv=v2&etag=da51c0ca0cd4787d48f933247425075c',
        actualValue[0].url);
  });
}
