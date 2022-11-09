import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/album.dart';
import 'package:json_annotation/json_annotation.dart';

import 'artist.dart';
import 'external_urls.dart';
import 'image.dart';

part 'album.g.dart';

@JsonSerializable()
class AlbumModel extends Equatable {
  @JsonKey(name: 'album_type')
  final String? albumType;
  @JsonKey(toJson: listToArtists)
  final List<ArtistModel>? artists;
  @JsonKey(name: 'external_urls')
  final ExternalUrlsModel? externalUrls;
  final String? id;
  // @JsonKey(toJson: listToImage)
  final List<ImagesModel>? images;
  final String? name;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'release_date_precision')
  final String? releaseDatePrecision;
  @JsonKey(name: 'total_tracks')
  final int? totalTracks;
  final String? type;
  final String? uri;

  const AlbumModel({
    this.albumType,
    this.artists,
    this.externalUrls,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      albumType,
      artists,
      externalUrls,
      id,
      images,
      name,
      releaseDate,
      releaseDatePrecision,
      totalTracks,
      type,
      uri,
    ];
  }

  Album toEntity() {
    return Album(
      albumType: albumType,
      artists: artists?.map((e) => e.toEntity()).toList(),
      externalUrls: externalUrls?.toEntity(),
      id: id,
      images: images?.map((e) => e.toEntity()).toList(),
      name: name,
      releaseDate: releaseDate,
      releaseDatePrecision: releaseDatePrecision,
      totalTracks: totalTracks,
      type: type,
      uri: uri,
    );
  }
}

dynamic listToImage(List<ImagesModel>? i) {
  return i?.map((e) => e.toJson()).toList();
}

dynamic listToArtists(List<ArtistModel>? a) {
  return a?.map((e) => e.toJson()).toList();
}
