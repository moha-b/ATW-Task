# Code Sample

```dart
class UserBloc extends Bloc<UserEvent, UserState> {
  final HomeRepository repo;

  UserBloc(this.repo) : super(UserInitial()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());
      var result = await repo.fetchUserData();
      result.fold(
        (failure) => emit(UserFailure(failure.errorMessage)),
        (user) => emit(UserSuccess(user)),
      );
    });
  }
}
```

```dart
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
```

```dart
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
```
