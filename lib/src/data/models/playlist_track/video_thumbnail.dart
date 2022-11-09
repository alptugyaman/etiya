import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/video_thumbnail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_thumbnail.g.dart';

@JsonSerializable()
class VideoThumbnailModel extends Equatable {
  final dynamic url;

  const VideoThumbnailModel({this.url});

  factory VideoThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$VideoThumbnailModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoThumbnailModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url];

  VideoThumbnail toEntity() => VideoThumbnail(url: url);
}
