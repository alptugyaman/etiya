import 'package:dartz/dartz.dart';
import 'package:etiya/src/core/network/network_exception.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:etiya/src/domain/entites/playlist/playlist.dart';
import 'package:etiya/src/domain/entites/playlist_track/playlist_track.dart';
import 'package:etiya/src/domain/repositories/playlist_track_repository.dart';

/// It's a class that gets the playlist data from the repository
class GetPlaylist {
  final PlaylistRepository _repository;
  GetPlaylist(this._repository);

  Future<Either<NetworkExceptions, PlaylistTrack>> getPlaylistTracks(
      int offset, int limit) {
    return _repository.getPlaylistTracks(
      offset: offset,
      limit: limit,
    );
  }

  Future<Either<NetworkExceptions, Playlist>> getPlaylistData() {
    return _repository.getPlaylistData();
  }

  Future<void> insertPlaylistTracksToLocal(
      LocalPlaylistTrack localPlaylistTrack) {
    return _repository.insertPlaylistTracksToLocal(
        localPlaylistTrack: localPlaylistTrack);
  }

  Future<List<LocalPlaylistTrack>?> getLocalPlaylistTracks(String input) {
    return _repository.getLocalPlaylistTracks(input);
  }
}
