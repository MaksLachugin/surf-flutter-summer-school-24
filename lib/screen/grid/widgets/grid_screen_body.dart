import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/bloc/photo_bloc.dart';
import 'package:surf_flutter_summer_school_24/screen/grid/widgets/grid_screen_photo_state_widget.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/ups_widget.dart';

class GridScreenBody extends StatefulWidget {
  const GridScreenBody({super.key});

  @override
  State<GridScreenBody> createState() => _GridScreenBodyState();
}

class _GridScreenBodyState extends State<GridScreenBody> {
  @override
  void initState() {
    super.initState();
    _pullRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: BlocBuilder<PhotoBloc, PhotoState>(
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
                    return RefreshIndicator(
                      onRefresh: _pullRefresh,
                      child: GridImageSuccessWidget(
                        state: state,
                      ),
                    );
                  case PhotoSelector():
                    return GridImageSelectorWidget(
                      state: state,
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pullRefresh() async {
    BlocProvider.of<PhotoBloc>(context).add(LoadPhoto());
  }
}
