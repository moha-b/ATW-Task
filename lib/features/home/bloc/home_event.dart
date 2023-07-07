part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends HomeEvent {}

class GetAlbum extends HomeEvent {
  final int userId;

  const GetAlbum(this.userId);
}

class GetPhoto extends HomeEvent {
  final int albumId;

  const GetPhoto(this.albumId);
}
