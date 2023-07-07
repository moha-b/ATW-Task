import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/enums.dart';
import 'package:task/features/home/bloc/home_bloc.dart';
import 'package:task/features/home/view/home_details_view.dart';

class MyAlbumsList extends StatelessWidget {
  const MyAlbumsList({
    super.key,
    required this.userId,
  });
  final int userId;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(GetAlbum(userId));
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.state == DataState.Success) {
            return buildAlbumList(state);
          } else if (state.state == DataState.Failure) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  ListView buildAlbumList(HomeState state) {
    return ListView.separated(
      itemCount: state.albums.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDetailScreen(
              albumId: state.albums[index].id,
              albumTitle: state.albums[index].title,
            ),
          ),
        ),
        child: ListTile(
          title: Text(state.albums[index].title),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
