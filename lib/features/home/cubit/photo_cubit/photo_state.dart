part of 'photo_cubit.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoSuccess extends PhotoState {
  final PhotoModel photo;

  const PhotoSuccess(this.photo);
}

class PhotoFailure extends PhotoState {}
