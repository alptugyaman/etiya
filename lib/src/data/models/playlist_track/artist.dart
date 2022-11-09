import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/artist.dart';
import 'package:json_annotation/json_annotation.dart';

import 'external_urls.dart';

part 'artist.g.dart';

@JsonSerializable()
class ArtistModel extends Equatable {
  @JsonKey(name: 'external_urls')
  final ExternalUrlsModel? externalUrls;
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  const ArtistModel({
    this.externalUrls,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return _$ArtistModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [externalUrls, id, name, type, uri];

  Artist toEntity() {
    return Artist(
      externalUrls: externalUrls?.toEntity(),
      id: id,
      name: name,
      type: type,
      uri: uri,
    );
  }
}
