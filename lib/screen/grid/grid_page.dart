import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/bloc/photo_bloc.dart';
import 'package:surf_flutter_summer_school_24/screen/grid/widgets/grid_app_bar.dart';
import 'widgets/grid_screen_body.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    var photoBloc = BlocProvider.of<PhotoBloc>(context);
    return BlocBuilder<PhotoBloc, PhotoState>(
      bloc: photoBloc,
      builder: (context, state) {
        return const Scaffold(
          appBar: GridAppBar(),
          body: GridScreenBody(),
        );
      },
    );
  }
}
