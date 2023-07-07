import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
      var data = await apiService.getMap(endPoint: '/users/2');
      return right(UserModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.message.toString()));
      }
      return left(ServerFailure('Failed to fetch user data'));
    }
  }

  @override
  Future<Either<Failure, List<AlbumModel>>> fetchUserAlbums(int userId) async {
    try {
      var data = await apiService.getList(endPoint: '/users/$userId/albums');
      return right(AlbumModel.from(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.message.toString()));
      }
      return left(ServerFailure('Failed to fetch user albums'));
    }
  }

  @override
  Future<Either<Failure, List<PhotoModel>>> fetchAlbumsPhotos(
      int albumId) async {
    try {
      var data = await apiService.getList(endPoint: '/albums/$albumId/photos');
      return right(PhotoModel.from(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.message.toString()));
      }
      return left(ServerFailure('Failed to fetch albums photos'));
    }
  }
}
