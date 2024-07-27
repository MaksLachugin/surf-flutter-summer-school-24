import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/feature/photo/bloc/photo_bloc.dart';
import 'package:surf_flutter_summer_school_24/uikit/widgets/custom_modal_bottom_sheet.dart';

class GridAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GridAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;
    var photoBloc = BlocProvider.of<PhotoBloc>(context);
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        return AppBar(
          title: Text("Постограм", style: style),
          elevation: 0,
          leading: (state is PhotoSelector)
              ? IconButton(
                  onPressed: () {
                    photoBloc.add(StopSelectPhoto());
                  },
                  icon: const Icon(Icons.arrow_back),
                )
              : Container(),
          centerTitle: true,
          actions: [
            (state is PhotoSelector)
                ? IconButton(
                    onPressed: () {
                      photoBloc.add(DeleteSelectPhoto());
                    },
                    icon: const Icon(Icons.delete),
                  )
                : Container(),
            IconButton(
                onPressed: () {
                  customModalBottomSheet(
                    context,
                  );
                },
                icon: const Icon(
                  Icons.more_vert_sharp,
                ))
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
