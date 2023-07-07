import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/data/model/album_model.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final HomeRepository repo;

  AlbumBloc(this.repo) : super(AlbumInitial()) {
    on<GetAlbums>((event, emit) async {
      emit(AlbumLoading());
      var result = await repo.fetchUserAlbums(event.userId);
      result.fold(
        (failure) => emit(AlbumFailure(failure.errorMessage)),
        (albums) => emit(AlbumSuccess(albums)),
      );
    });
  }
}
