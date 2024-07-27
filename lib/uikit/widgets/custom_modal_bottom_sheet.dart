import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/bloc/photo_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/theme.dart';
import 'package:surf_flutter_summer_school_24/screen/grid/widgets/line_button_of_bottom_sheet.dart';

Future<dynamic> customModalBottomSheet(BuildContext context) {
  final ImagePicker picker = ImagePicker();
  final style = Theme.of(context).textTheme.bodyLarge;
  var photoBloc = BlocProvider.of<PhotoBloc>(context);

  return showModalBottomSheet(
    context: context,
    builder: (context) {
      var themeController = ThemeInherited.of(context);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            LineButtonOfBottomSheet(
              onTap: () {
                themeController.switchThemeMode();
              },
              onTapUp: (_) {
                Navigator.pop(context);
              },
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.sunny,
                    ),
                    Text(
                      'Изменить тему',
                      style: style,
                    ),
                  ],
                ),
                Text(
                  themeController.themeMode.value.getName,
                  style: style,
                )
              ],
            ),
            LineButtonOfBottomSheet(
              onTap: () async {
                photoBloc
                    .add(UploadPhoto(files: await picker.pickMultiImage()));
              },
              onTapUp: (_) {
                Navigator.pop(context);
              },
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.cloud_upload,
                    ),
                    Text(
                      'Загрузить фото из галереи',
                      style: style,
                    ),
                  ],
                ),
                Text(
                  "",
                  style: style,
                )
              ],
            ),
            LineButtonOfBottomSheet(
              onTap: () async {
                var r = await picker.pickImage(source: ImageSource.camera);
                if (r != null) {
                  photoBloc.add(UploadPhoto(files: [r]));
                }
              },
              onTapUp: (_) {
                Navigator.pop(context);
              },
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.cloud_upload,
                    ),
                    Text(
                      'Сделать фото',
                      style: style,
                    ),
                  ],
                ),
                Text(
                  "",
                  style: style,
                )
              ],
            ),
          ],
        ),
      );
    },
  );
}
