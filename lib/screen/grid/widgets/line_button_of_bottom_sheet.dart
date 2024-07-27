import 'package:flutter/material.dart';

class LineButtonOfBottomSheet extends StatelessWidget {
  final void Function() onTap;

  final List<Widget> children;

  final void Function(TapUpDetails) onTapUp;

  const LineButtonOfBottomSheet({
    super.key,
    required this.onTap,
    required this.children,
    required this.onTapUp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        onTapUp: onTapUp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
