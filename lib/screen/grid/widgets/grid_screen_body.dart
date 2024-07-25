import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/bloc/photo_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/repo/mock_photo_repo.dart';
import 'package:surf_flutter_summer_school_24/screen/grid/widgets/grid_screen_photo_state_widget.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/ups_widget.dart';

class GridScreenBody extends StatefulWidget {
  const GridScreenBody({super.key});

  @override
  State<GridScreenBody> createState() => _GridScreenBodyState();
}

class _GridScreenBodyState extends State<GridScreenBody> {
  final PhotoBloc _photoBloc = PhotoBloc(MockPhotoRepo());

  @override
  void initState() {
    _photoBloc.add(LoadPhoto());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            height: 750,
            child: BlocBuilder<PhotoBloc, PhotoState>(
              bloc: _photoBloc,
              builder: (context, state) {
                switch (state) {
                  case PhotoLoading():
                    return const Center(
                      child: SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case PhotoError():
                    return const UpsWidget();
                  case PhotoSuccess():
                    return GridImageSuccessWidget(
                      photos: state.photos,
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
