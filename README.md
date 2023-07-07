# Code Sample

```dart
class UserCubit extends Cubit<UserState> {
  UserCubit(this.repo) : super(UserInitial());

  final HomeRepository repo;
  Future<void> fetchUser() async {
    emit(UserLoading());
    var result = await repo.fetchUserData();
    result.fold((failure) => emit(UserFailure(failure.errorMessage)),
        (user) => emit(UserSuccess(user)));
  }
}
```
```dart
class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit(this.repo) : super(PhotoInitial());

  final HomeRepository repo;

  Future<void> fetchPhotos(int albumId) async {
    emit(PhotoLoading());
    var result = await repo.fetchAlbumsPhotos(albumId);
    result.fold(
      (failure) => emit(PhotoFailure(failure.errorMessage)),
      (photos) => emit(PhotoSuccess(photos)),
    );
  }
}
```
```dart
class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit(this.repo) : super(AlbumInitial());

  final HomeRepository repo;

  Future<void> fetchAlbums(int userId) async {
    emit(AlbumLoading());
    var result = await repo.fetchUserAlbums(userId);
    result.fold(
      (failure) => emit(AlbumFailure(failure.errorMessage)),
      (albums) => emit(AlbumSuccess(albums)),
    );
  }
}
```
