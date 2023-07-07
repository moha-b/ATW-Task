import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/services/locator_service.dart';
import 'package:task/core/utils/styles.dart';
import 'package:task/features/home/cubit/photo_cubit/photo_cubit.dart';
import 'package:task/features/home/data/source/home_repo_impl.dart';
import 'package:task/features/home/view/widgets/grid_view_widget.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen(
      {super.key, required this.albumId, required this.albumTitle});

  final int albumId;
  final String albumTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              PhotoCubit(locator.get<HomeRepoImpl>())..fetchPhotos(albumId),
          child: BlocBuilder<PhotoCubit, PhotoState>(builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(albumTitle, style: AppStyles.titleStyle),
                ),
                Expanded(
                  child: BlocBuilder<PhotoCubit, PhotoState>(
                    builder: (context, state) {
                      if (state is PhotoSuccess) {
                        return BuildGridView(state: state);
                      } else if (state is PhotoFailure) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
