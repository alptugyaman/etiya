import 'package:equatable/equatable.dart';

import 'artist.dart';
import 'external_urls.dart';
import 'images.dart';

class Album extends Equatable {
  final String? albumType;
  final List<Artist>? artists;
  final ExternalUrls? externalUrls;
  final String? id;
  final List<Images>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final int? totalTracks;
  final String? type;
  final String? uri;

  const Album({
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
}
