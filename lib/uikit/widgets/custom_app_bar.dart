import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<Widget> children;

  const CustomAppBar({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
