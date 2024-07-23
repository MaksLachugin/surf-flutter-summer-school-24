import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/di/theme_inherited.dart';

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
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              ThemeInherited.of(context).switchThemeMode();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.sunny),
                                    Text('Изменить тему'),
                                  ],
                                ),
                                Text(
                                    "${ThemeInherited.of(context).themeMode.value.name}")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.cloud_upload),
                                    Text('Загрузить фото...'),
                                  ],
                                ),
                                Text("")
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.more_vert_sharp,
              ))
        ],
      ),
      body: const GridScreenBody(),
    );
  }
}
