import 'package:etiya/src/core/constants/db_constants.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:floor/floor.dart';

/// This class is a data access object (DAO) that allows us to query the database for playlist tracks
@dao
abstract class PlaylistTrackDao {
  /// A query that returns a list of LocalPlaylistTrack objects.
  @Query(
      'SELECT * from ${DBConstants.playlistTracksTable} WHERE (artists LIKE :input OR songName LIKE :input)')
  Future<List<LocalPlaylistTrack>?> getPlaylistTracks(String input);

  /// Inserting a new playlist track to the database.
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPlaylistTracks(LocalPlaylistTrack localPlaylistTrack);
}
