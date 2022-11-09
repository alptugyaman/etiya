import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';

import 'item.dart';

class PlaylistTrack extends Equatable {
  final List<Item>? items;
  final int? limit;
  final dynamic next;
  final int? offset;
  final dynamic previous;
  final int? total;

  const PlaylistTrack({
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      items,
      limit,
      next,
      offset,
      previous,
      total,
    ];
  }

  static LocalPlaylistTrack remoteToLocal(Item item) {
    return LocalPlaylistTrack(
      image: item.track!.album!.images?[0].url,
      songName: item.track!.album!.name,
      artists:
          item.track!.album!.artists!.map((e) => e.name).toList().join(', '),
      duration: item.track!.durationMs,
    );
  }
}
