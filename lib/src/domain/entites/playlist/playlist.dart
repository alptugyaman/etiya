import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist extends Equatable {
  final bool? collaborative;
  final String? description;
  final List<Image>? images;
  final String? name;
  final bool? public;
  final String? uri;

  const Playlist({
    this.collaborative,
    this.description,
    this.images,
    this.name,
    this.public,
    this.uri,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return _$PlaylistFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      collaborative,
      description,
      images,
      name,
      public,
      uri,
    ];
  }
}
