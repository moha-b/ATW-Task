import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/enums.dart';
import 'package:task/features/home/data/model/home_models.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repo;

  HomeBloc(this.repo) : super(HomeState()) {
    on<GetUser>((event, emit) async {
      var result = await repo.fetchUserData();
      result.fold(
        (failure) => emit(state.copyWith(
            state: DataState.Failure, message: failure.errorMessage)),
        (user) => emit(state.copyWith(state: DataState.Success, user: user)),
      );
    });

    on<GetAlbum>((event, emit) async {
      var result = await repo.fetchUserAlbums(event.userId);
      result.fold(
        (failure) => emit(state.copyWith(
            state: DataState.Failure, message: failure.errorMessage)),
        (albums) =>
            emit(state.copyWith(state: DataState.Success, albums: albums)),
      );
    });

    on<GetPhoto>((event, emit) async {
      var result = await repo.fetchAlbumsPhotos(event.albumId);
      result.fold(
        (failure) => emit(state.copyWith(
            state: DataState.Failure, message: failure.errorMessage)),
        (photos) =>
            emit(state.copyWith(state: DataState.Success, photos: photos)),
      );
    });
  }
}
