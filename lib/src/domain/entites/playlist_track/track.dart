import 'package:equatable/equatable.dart';

import 'album.dart';
import 'artist.dart';
import 'external_ids.dart';
import 'external_urls.dart';

class Track extends Equatable {
  final Album? album;
  final List<Artist>? artists;
  final int? discNumber;
  final int? durationMs;
  final bool? episode;
  final bool? explicit;
  final ExternalIds? externalIds;
  final ExternalUrls? externalUrls;
  final String? id;
  final bool? isLocal;
  final bool? isPlayable;
  final String? name;
  final int? popularity;
  final String? previewUrl;
  final bool? track;
  final int? trackNumber;
  final String? type;
  final String? uri;

  const Track({
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
}
