import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist/playlist.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'playlist.g.dart';

@JsonSerializable()
class PlaylistModel extends Equatable {
  final bool? collaborative;
  final String? description;
  final List<ImageModel>? images;
  final String? name;
  final bool? public;
  final String? uri;

  const PlaylistModel({
    this.collaborative,
    this.description,
    this.images,
    this.name,
    this.public,
    this.uri,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return _$PlaylistModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaylistModelToJson(this);

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

  Playlist toEntity() {
    return Playlist(
      collaborative: collaborative,
      description: description,
      images: images?.map((e) => e.toEntity()).toList(),
      name: name,
      public: public,
      uri: uri,
    );
  }
}
