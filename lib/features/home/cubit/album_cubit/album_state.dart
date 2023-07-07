part of 'album_cubit.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumSuccess extends AlbumState {
  final AlbumModel album;

  const AlbumSuccess(this.album);
}

class AlbumFailure extends AlbumState {}
