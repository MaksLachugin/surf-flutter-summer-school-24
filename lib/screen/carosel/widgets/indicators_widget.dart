import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/carousel/cubit/carousel_cubit.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({
    super.key,
    required this.setter,
  });

  final void Function(int index) setter;

  @override
  Widget build(BuildContext context) {
    var focusColor = Theme.of(context).colorScheme.secondary;
    var unFocusColor = Theme.of(context).colorScheme.onSecondary;

    return BlocBuilder<CarouselCubit, CarouselState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            controller: ScrollController(
                initialScrollOffset: 10 * state.current.toDouble()),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                state.max,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setter(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: state.current == index
                              ? focusColor
                              : unFocusColor,
                          shape: BoxShape.circle),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
