# surf_flutter_summer_school_24

Шаблонный репозиторий для Surf Flutter Summer School '24

Надо создать \surf_flutter_summer_school_24\lib\storage\photo_repo

my_ya_photo_storage.dart

class MyYaPhotoStorage extends YaPhotoStorage {
  @override
  get token => "";
}

На диске фотки будут подтягиваться из папки /surf_flutter_summer_school_24/, так же можно переопределить

DI (GetIt) используется гениально в функции main.
Управление состоянием через BLoC.

Есть:
-4 день
Получение изображений из галереи и камеры  - через модальное окно
Работа с сервером (загрузка и выгрузка фото) - загрузка, выгрузка, удаление
Модели данных (для десериализации и бизнес-логики) - PhotoEntity
Обработка ошибок - есть заглушка на случай ошибок, обработчиков вроде нет
Удаление фотографий массовое с главного экрана - зажатие любой пикчи на главной
После загрузки фото, главный экран обновляется

Ньюансы:
В PageView смежные фото иногда исчезают.
Из анимаций только "плавный" скролл PageView (animateToPage) через "точки".
В веб версии PageView не листается, перемещение осуществляется через "точки".

Главный экран
![Главный экран](https://github.com/MaksLachugin/surf-flutter-summer-school-24/blob/main/docs/1000172335.png)

Меню удаления
![Меню удаления](https://github.com/MaksLachugin/surf-flutter-summer-school-24/blob/main/docs/1000172336.png)

Меню загрузки фото и смены темы
![Меню загрузки фото и смены темы](https://github.com/MaksLachugin/surf-flutter-summer-school-24/blob/main/docs/1000172338.png)

Смена темы
![Смена темы](https://github.com/MaksLachugin/surf-flutter-summer-school-24/blob/main/docs/1000172339.png)

Меню детального просмотра
![Меню детального просмотра](https://github.com/MaksLachugin/surf-flutter-summer-school-24/blob/main/docs/1000172340.png)
