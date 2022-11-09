import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/images.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImagesModel extends Equatable {
  final int? height;
  final String? url;
  final int? width;

  const ImagesModel({this.height, this.url, this.width});

  factory ImagesModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [height, url, width];

  Images toEntity() {
    return Images(
      height: height,
      url: url,
      width: width,
    );
  }
}
