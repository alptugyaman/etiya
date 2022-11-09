import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:etiya/src/core/network/network_exception.dart';
import 'package:etiya/src/data/datasources/local/app_database.dart';
import 'package:etiya/src/data/datasources/remote/remote_data_source.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:etiya/src/domain/entites/playlist/playlist.dart';
import 'package:etiya/src/domain/entites/playlist_track/playlist_track.dart';
import 'package:etiya/src/domain/repositories/playlist_track_repository.dart';

/// It's a repository class that implements the PlaylistRepository interface
class PlaylistRepositoryImpl implements PlaylistRepository {
  PlaylistRepositoryImpl({
    required this.remoteDataSource,
    required this.appDatabase,
  });

  final RemoteDataSource remoteDataSource;
  final AppDatabase appDatabase;

  //* API
  /// > It calls the remote data source, and if it succeeds, it returns a Right of the result, otherwise
  /// it returns a Left of the error
  ///
  /// Returns:
  ///   Either<NetworkExceptions, Playlist>
  @override
  Future<Either<NetworkExceptions, Playlist>> getPlaylistData() async {
    try {
      final result = await remoteDataSource.getPlaylistData();
      return Right(result.toEntity());
    } on DioError catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }

  //* API
  /// > It calls the remote data source to get the playlist tracks, and if it succeeds, it returns a Right
  /// of the result, otherwise it returns a Left of the error
  ///
  /// Args:
  ///   offset (int): The index of the first item to return. Default: 0 (the first object). Use with limit
  /// to get the next set of items.
  ///   limit (int): The number of objects to return. Default: 20. Minimum: 1. Maximum: 50.
  ///
  /// Returns:
  ///   Either<NetworkExceptions, PlaylistTrack>
  @override
  Future<Either<NetworkExceptions, PlaylistTrack>> getPlaylistTracks({
    required int offset,
    required int limit,
  }) async {
    try {
      final result = await remoteDataSource.getPlaylistTracks(offset, limit);
      return Right(result.toEntity());
    } on DioError catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }

  //* DB
  /// It inserts a playlist track to the local database.
  ///
  /// Args:
  ///   localPlaylistTrack (LocalPlaylistTrack): This is the object of the LocalPlaylistTrack class.
  @override
  Future<void> insertPlaylistTracksToLocal(
      {required LocalPlaylistTrack localPlaylistTrack}) async {
    await appDatabase.playlistTrackDao.insertPlaylistTracks(localPlaylistTrack);
  }

  //* DB
  /// > Get all the tracks in a playlist
  ///
  /// Args:
  ///   input (String): The name of the playlist you want to get the tracks for.
  ///
  /// Returns:
  ///   A list of LocalPlaylistTrack objects.
  @override
  Future<List<LocalPlaylistTrack>?> getLocalPlaylistTracks(String input) async {
    return appDatabase.playlistTrackDao.getPlaylistTracks(input);
  }
}
