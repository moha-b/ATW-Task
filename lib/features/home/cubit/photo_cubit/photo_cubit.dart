import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/data/model/photo_model.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

part 'photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit(this.repo) : super(PhotoInitial());

  final HomeRepository repo;
  Future<void> fetchUser(int albumId) async {
    emit(PhotoLoading());
    var result = await repo.fetchAlbumsPhotos(albumId);
    result.fold((failure) => emit(PhotoFailure()),
        (photo) => emit(PhotoSuccess(photo)));
  }
}
