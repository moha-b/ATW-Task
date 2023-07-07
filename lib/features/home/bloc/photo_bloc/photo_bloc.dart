import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/data/model/photo_model.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final HomeRepository repo;
  PhotoBloc(this.repo) : super(PhotoInitial()) {
    on<GetPhoto>((event, emit) async {
      var result = await repo.fetchAlbumsPhotos(event.albumId);
      result.fold(
        (failure) => emit(PhotoFailure(failure.errorMessage)),
        (photos) => emit(PhotoSuccess(photos)),
      );
    });
  }
}
