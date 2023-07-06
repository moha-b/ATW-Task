import 'package:equatable/equatable.dart';

class AlbumModel extends Equatable {
  final int userId;
  final int id;
  final String title;

  const AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  static List<AlbumModel> from(List<dynamic> json) {
    return json.map((e) => AlbumModel.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [userId, id, title];
}
