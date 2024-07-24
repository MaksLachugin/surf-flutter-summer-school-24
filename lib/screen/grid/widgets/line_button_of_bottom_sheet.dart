import 'package:flutter/material.dart';

class LineButtonOfBottomSheet extends StatelessWidget {
  final void Function() onTap;

  final List<Widget> children;

  const LineButtonOfBottomSheet({
    super.key,
    required this.onTap,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
