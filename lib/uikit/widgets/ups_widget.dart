import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/screen/grid/grid_page.dart';

class UpsScreen extends StatelessWidget {
  const UpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UpsWidget(),
    );
  }
}

class UpsWidget extends StatelessWidget {
  const UpsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme style = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "😪",
            style: style.displayLarge,
          ),
          Text(
            "Упс",
            style: style.displayMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Произошла ошибка",
                  style: style.bodyLarge,
                ),
                Text(
                  "Попробуйте снова",
                  style: style.bodyLarge,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const GridPage();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Попробуйте снова",
                style: style.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
