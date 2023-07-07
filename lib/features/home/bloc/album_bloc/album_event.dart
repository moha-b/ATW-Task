part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class GetAlbums extends AlbumEvent {
  final int userId;

  const GetAlbums(this.userId);
}
