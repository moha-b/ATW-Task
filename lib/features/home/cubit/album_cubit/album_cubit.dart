import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/data/model/album_model.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit(this.repo) : super(AlbumInitial());

  final HomeRepository repo;
  Future<void> fetchUser(int userId) async {
    emit(AlbumLoading());
    var result = await repo.fetchUserAlbums(userId);
    result.fold((failure) => emit(AlbumFailure()),
        (album) => emit(AlbumSuccess(album)));
  }
}
