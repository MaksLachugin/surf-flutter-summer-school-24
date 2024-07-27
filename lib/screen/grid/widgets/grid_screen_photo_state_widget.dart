import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/bloc/photo_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/entity/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/carousel_page.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/image_box_view.dart';

class GridImageSuccessWidget extends StatelessWidget {
  const GridImageSuccessWidget({
    super.key,
    required this.state,
  });
  final PhotoSuccess state;

  @override
  Widget build(BuildContext context) {
    List<PhotoEntity> photos = state.photos;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 3,
      ),
      itemCount: photos.length,
      itemBuilder: (buildContext, index) {
        return InkWell(
          onTap: () {
            routeToPhotoScreen(context, photos, index);
          },
          onLongPress: () {
            _selectMode(context, photos[index].id);
          },
          child: ImageBoxViewNetworkWidget(
            url: photos[index].smallerImage,
          ),
        );
      },
    );
  }

  Future<void> _selectMode(BuildContext context, String id) async {
    BlocProvider.of<PhotoBloc>(context).add(StartSelectPhoto(id: id));
  }
}

class GridImageSelectorWidget extends StatefulWidget {
  const GridImageSelectorWidget({
    super.key,
    required this.state,
  });
  final PhotoSelector state;

  @override
  State<GridImageSelectorWidget> createState() =>
      _GridImageSelectorWidgetState();
}

class _GridImageSelectorWidgetState extends State<GridImageSelectorWidget> {
  _GridImageSelectorWidgetState();

  @override
  Widget build(BuildContext context) {
    List<PhotoEntity> photos = widget.state.photos;
    List<String> selectedId = widget.state.selectedId;
    var backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 3,
      ),
      itemCount: photos.length,
      itemBuilder: (buildContext, index) {
        bool isSelect = selectedId.contains(photos[index].id);
        return InkWell(
          onTap: () {
            _selectItem(photos[index].id);
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageBoxViewNetworkWidget(
                url: photos[index].smallerImage,
              ),
              Positioned(
                left: 0,
                top: 0,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(10)),
                  child: Container(
                    color: backgroundColor,
                    child: Icon(isSelect
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectItem(String id) async {
    BlocProvider.of<PhotoBloc>(context).add(ChangeSelectPhoto(id: id));
  }
}

void routeToPhotoScreen(
    BuildContext context, List<PhotoEntity> photos, int index) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return CarouselPage(
          photos: photos,
          current: index,
        );
      },
    ),
  );
}
