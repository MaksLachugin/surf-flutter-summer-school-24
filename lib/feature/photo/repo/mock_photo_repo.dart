import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/repo/photo_repo.dart';

class MockPhotoRepo implements PhotoRepo {
  @override
  Future<List<PhotoEntity>> getListPhoto() {
    return Future.delayed(
      Duration.zero,
      () {
        return [
          PhotoEntity(
            id: '123',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2019/11/Car-Background-Wallpaper-009-768x1664.jpg',
          ),
          PhotoEntity(
            id: '124',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2021/06/Car-Phone-Wallpaper-097-768x1707.jpg',
          ),
          PhotoEntity(
            id: '125',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2021/06/Car-Phone-Wallpaper-094-768x1707.jpg',
          ),
          PhotoEntity(
            id: '127',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2021/06/Car-Phone-Wallpaper-186-768x1707.jpg',
          ),
          PhotoEntity(
            id: '128',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2019/11/Car-Background-Wallpaper-032-768x1664.jpg',
          ),
          PhotoEntity(
            id: '134',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2019/11/Car-Background-Wallpaper-036-768x1664.jpg',
          ),
          PhotoEntity(
            id: '137',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2019/11/Car-Background-Wallpaper-037-768x1664.jpg',
          ),
          PhotoEntity(
            id: '147',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2019/11/Car-Background-Wallpaper-047-768x1664.jpg',
          ),
          PhotoEntity(
            id: '149',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2019/11/Car-Background-Wallpaper-049-768x1664.jpg',
          ),
          PhotoEntity(
            id: '180',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2019/11/Car-Background-Wallpaper-080-768x1664.jpg',
          ),
          PhotoEntity(
            id: '182',
            url:
                'https://www.fonewalls.com/wp-content/uploads/2019/11/Car-Background-Wallpaper-082-768x1664.jpg',
          ),
          PhotoEntity(
            id: '168',
            url:
                'https://w0.peakpx.com/wallpaper/68/270/HD-wallpaper-rog-phone-5-asus-rog-phone.jpg',
          ),
        ];
      },
    );
  }
}
