part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoSuccess extends PhotoState {
  final List<PhotoModel> photos;

  const PhotoSuccess(this.photos);
}

class PhotoFailure extends PhotoState {
  final String message;

  const PhotoFailure(this.message);
}
