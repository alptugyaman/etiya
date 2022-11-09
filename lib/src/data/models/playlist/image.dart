import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist/image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageModel extends Equatable {
  final dynamic height;
  final String? url;
  final dynamic width;

  const ImageModel({this.height, this.url, this.width});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [height, url, width];

  Image toEntity() {
    return Image(
      height: height,
      url: url,
      width: width,
    );
  }
}
