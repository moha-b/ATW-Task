part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class GetPhoto extends PhotoEvent {
  final int albumId;

  const GetPhoto(this.albumId);
}
