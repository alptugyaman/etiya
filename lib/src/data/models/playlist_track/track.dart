import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/track.dart';
import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'artist.dart';
import 'external_ids.dart';
import 'external_urls.dart';

part 'track.g.dart';

@JsonSerializable()
class TrackModel extends Equatable {
  final AlbumModel? album;
  @JsonKey(toJson: listToArtists)
  final List<ArtistModel>? artists;
  @JsonKey(name: 'disc_number')
  final int? discNumber;
  @JsonKey(name: 'duration_ms')
  final int? durationMs;
  final bool? episode;
  final bool? explicit;
  @JsonKey(name: 'external_ids')
  final ExternalIdsModel? externalIds;
  @JsonKey(name: 'external_urls')
  final ExternalUrlsModel? externalUrls;
  final String? id;
  @JsonKey(name: 'is_local')
  final bool? isLocal;
  @JsonKey(name: 'is_playable')
  final bool? isPlayable;
  final String? name;
  final int? popularity;
  @JsonKey(name: 'preview_url')
  final String? previewUrl;
  final bool? track;
  @JsonKey(name: 'track_number')
  final int? trackNumber;
  final String? type;
  final String? uri;

  const TrackModel({
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) => _$TrackModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      album,
      artists,
      discNumber,
      durationMs,
      episode,
      explicit,
      externalIds,
      externalUrls,
      id,
      isLocal,
      isPlayable,
      name,
      popularity,
      previewUrl,
      track,
      trackNumber,
      type,
      uri,
    ];
  }

  Track toEntity() {
    return Track(
      album: album?.toEntity(),
      artists: artists?.map((e) => e.toEntity()).toList(),
      discNumber: discNumber,
      durationMs: durationMs,
      episode: episode,
      explicit: explicit,
      externalIds: externalIds?.toEntity(),
      externalUrls: externalUrls?.toEntity(),
      id: id,
      isLocal: isLocal,
      isPlayable: isPlayable,
      name: name,
      popularity: popularity,
      previewUrl: previewUrl,
      track: track,
      trackNumber: trackNumber,
      type: type,
      uri: uri,
    );
  }
}
