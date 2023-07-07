import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/services/api_service.dart';
import 'package:task/features/home/data/model/home_models.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepository {
  ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> fetchUserData() async {
    try {
      var data = await apiService.get(endPoint: '/users/2');
      return right(UserModel.fromJson(data));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AlbumModel>> fetchUserAlbums(int userId) async {
    try {
      var data = await apiService.get(endPoint: '/users/$userId/albums');
      return right(AlbumModel.fromJson(data));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PhotoModel>> fetchAlbumsPhotos(int albumId) async {
    try {
      var data = await apiService.get(endPoint: '/albums/$albumId/photos');
      return right(PhotoModel.fromJson(data));
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
