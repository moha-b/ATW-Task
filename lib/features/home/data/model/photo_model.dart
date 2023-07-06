import 'package:equatable/equatable.dart';

class PhotoModel extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  static List<PhotoModel> from(List<dynamic> json) {
    return json.map((e) => PhotoModel.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];
}
