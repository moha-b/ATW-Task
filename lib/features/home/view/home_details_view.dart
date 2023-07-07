import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/enums.dart';
import 'package:task/core/utils/styles.dart';
import 'package:task/features/home/bloc/home_bloc.dart';
import 'package:task/features/home/view/widgets/grid_view_widget.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen(
      {super.key, required this.albumId, required this.albumTitle});

  final int albumId;
  final String albumTitle;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(GetPhoto(albumId));
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(albumTitle, style: AppStyles.titleStyle),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.state == DataState.Success) {
                    return BuildGridView(state: state);
                  } else if (state.state == DataState.Failure) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
