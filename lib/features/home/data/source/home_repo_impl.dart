import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/home/data/model/home_models.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepository {
  @override
  Future<Either<Failure, PhotoModel>> fetchAlbumsPhotos() {
    // TODO: implement fetchAlbumsPhotos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AlbumModel>> fetchUserAlbums() {
    // TODO: implement fetchUserAlbums
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> fetchUserData() {
    // TODO: implement fetchUserData
    throw UnimplementedError();
  }
}
