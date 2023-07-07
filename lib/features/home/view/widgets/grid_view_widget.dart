import 'package:flutter/material.dart';
import 'package:task/features/home/bloc/home_bloc.dart';

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    super.key,
    required this.state,
  });
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: state.photos.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Image.network(
        state.photos[index].thumbnailUrl,
      ),
    );
  }
}
