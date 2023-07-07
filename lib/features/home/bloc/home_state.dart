part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.state = DataState.Loading,
    this.user = const UserModel(),
    this.photos = const [],
    this.albums = const [],
    this.message = "Nothing",
  });

  final DataState state;
  final UserModel user;
  final List<PhotoModel> photos;
  final List<AlbumModel> albums;
  final String message;

  HomeState copyWith({
    DataState? state,
    UserModel? user,
    List<PhotoModel>? photos,
    List<AlbumModel>? albums,
    String? message,
  }) {
    return HomeState(
      state: state ?? this.state,
      user: user ?? this.user,
      albums: albums ?? this.albums,
      photos: photos ?? this.photos,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [state, user, photos, albums, message];
}

// class Initial extends HomeState {}
//
// class Loading extends HomeState {}
//
// class Success extends HomeState {
//   final UserModel user;
//   final List<PhotoModel> photos;
//   final List<AlbumModel> albums;
//
//   const Success({
//     this.user = const UserModel(),
//     this.photos = const [],
//     this.albums = const [],
//   });
//
//   Success copyWith({
//     UserModel? user,
//     List<PhotoModel>? photos,
//     List<AlbumModel>? albums,
//   }) {
//     return Success(
//         user: user ?? this.user,
//         albums: albums ?? this.albums,
//         photos: photos ?? this.photos);
//   }
// }
//
// class Failure extends HomeState {
//   final String message;
//
//   const Failure(this.message);
// }
