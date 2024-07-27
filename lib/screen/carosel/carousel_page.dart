import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/carousel/cubit/carousel_cubit.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/widgets/carousel_screen_body.dart';

import 'widgets/carousel_app_bar.dart';

class CarouselPage extends StatelessWidget {
  final List<PhotoEntity> photos;

  final int current;

  const CarouselPage({
    super.key,
    required this.photos,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselCubit()..buildState(photos, current),
      child: const Scaffold(
        appBar: CarouselAppBar(),
        body: CarouselScreenBody(),
      ),
    );
  }
}
