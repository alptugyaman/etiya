import 'package:dartz/dartz.dart';
import 'package:etiya/src/core/network/network_exception.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:etiya/src/domain/entites/playlist/playlist.dart';
import 'package:etiya/src/domain/entites/playlist_track/playlist_track.dart';

/// It's a repository class that fetches data from the API and stores it in the local database
abstract class PlaylistRepository {
  //* API
  Future<Either<NetworkExceptions, Playlist>> getPlaylistData();

  //* API
  Future<Either<NetworkExceptions, PlaylistTrack>> getPlaylistTracks({
    required int offset,
    required int limit,
  });

  //* DB
  Future<void> insertPlaylistTracksToLocal(
      {required LocalPlaylistTrack localPlaylistTrack});

  //* DB
  Future<List<LocalPlaylistTrack>?> getLocalPlaylistTracks(String input);
}
