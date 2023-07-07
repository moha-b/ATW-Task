import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/home/data/model/home_models.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserModel>> fetchUserData();
  Future<Either<Failure, AlbumModel>> fetchUserAlbums(int userId);
  Future<Either<Failure, PhotoModel>> fetchAlbumsPhotos(int albumId);
}
