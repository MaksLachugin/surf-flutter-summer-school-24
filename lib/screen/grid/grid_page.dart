import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/theme.dart';
import 'package:surf_flutter_summer_school_24/screen/grid/widgets/line_button_of_bottom_sheet.dart';
import 'widgets/grid_screen_body.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Постограм"),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                customModalBottomSheet(context);
              },
              icon: const Icon(
                Icons.more_vert_sharp,
              ))
        ],
      ),
      body: const GridScreenBody(),
    );
  }

  Future<dynamic> customModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        var themeController = ThemeInherited.of(context);
        return Wrap(
          children: [
            LineButtonOfBottomSheet(
              onTap: () {
                themeController.switchThemeMode();
              },
              children: [
                const Row(
                  children: [
                    Icon(Icons.sunny),
                    Text('Изменить тему'),
                  ],
                ),
                Text(themeController.themeMode.value.getName)
              ],
            ),
            LineButtonOfBottomSheet(
              onTap: () {},
              children: const [
                Row(
                  children: [
                    Icon(Icons.cloud_upload),
                    Text('Загрузить фото...'),
                  ],
                ),
                Text("")
              ],
            ),
          ],
        );
      },
    );
  }
}
