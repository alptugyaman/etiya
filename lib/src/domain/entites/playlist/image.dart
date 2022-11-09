import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image extends Equatable {
  final dynamic height;
  final String? url;
  final dynamic width;

  const Image({this.height, this.url, this.width});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [height, url, width];
}
