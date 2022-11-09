import 'package:etiya/src/core/constants/application_constants.dart';
import 'package:etiya/src/core/constants/url_constants.dart';
import 'package:etiya/src/core/network/network_manager.dart';
import 'package:etiya/src/data/models/playlist/playlist.dart';
import 'package:etiya/src/data/models/playlist_track/playlist_track.dart';

/// It's an abstract class that defines the methods that will be used to fetch data
/// from the remote data source
abstract class RemoteDataSource {
  Future<PlaylistTrackModel> getPlaylistTracks(int offset, int limit);
  Future<PlaylistModel> getPlaylistData();
}

/// It's a class that implements the RemoteDataSource interface and uses the NetworkManager class to
/// make network calls
class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({required this.networkManager});
  NetworkManager networkManager;

  /// It fetches the playlist tracks from the server.
  ///
  /// Args:
  ///   offset (int): The offset of the first track to return.
  ///   limit (int): The number of objects to return. Default: 20. Minimum: 1. Maximum: 100.
  ///
  /// Returns:
  ///   A Future<PlaylistTrackModel>
  @override
  Future<PlaylistTrackModel> getPlaylistTracks(int offset, int limit) async {
    try {
      final response = await networkManager.dio.get(
        UrlContants.playlistTracks,
        queryParameters: {
          'id': ApplicationConstants.id,
          'offset': offset,
          'limit': limit,
        },
      );

      final playlistTrackModel =
          PlaylistTrackModel.fromJson(response.data as Map<String, dynamic>);

      return playlistTrackModel;
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// It fetches the playlist data from the server.
  ///
  /// Returns:
  ///   A Future<PlaylistModel>
  @override
  Future<PlaylistModel> getPlaylistData() async {
    try {
      final response = await networkManager.dio.get(
        UrlContants.playlist,
        queryParameters: {'id': ApplicationConstants.id},
      );

      final playlistModel =
          PlaylistModel.fromJson(response.data as Map<String, dynamic>);

      return playlistModel;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
