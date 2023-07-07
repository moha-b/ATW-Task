part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumSuccess extends AlbumState {
  final List<AlbumModel> albums;

  const AlbumSuccess(this.albums);
}

class AlbumFailure extends AlbumState {
  final String message;

  const AlbumFailure(this.message);
}
