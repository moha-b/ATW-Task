import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/services/locator_service.dart';
import 'package:task/features/home/cubit/album_cubit/album_cubit.dart';
import 'package:task/features/home/data/source/home_repo_impl.dart';
import 'package:task/features/home/view/home_details_view.dart';

class MyAlbumsList extends StatelessWidget {
  const MyAlbumsList({
    super.key,
    required this.userId,
  });
  final int userId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AlbumCubit(locator.get<HomeRepoImpl>())..fetchAlbums(userId),
      child: Expanded(
        child: BlocBuilder<AlbumCubit, AlbumState>(
          builder: (context, state) {
            if (state is AlbumSuccess) {
              return buildAlbumList(state);
            } else if (state is AlbumFailure) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  ListView buildAlbumList(AlbumSuccess state) {
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
