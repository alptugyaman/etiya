import 'dart:async';

import 'package:etiya/src/data/datasources/local/DAOs/playlist_track_dao.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

/// AppDatabase is a database that has a version of 1 and contains a single table called
/// LocalPlaylistTrack
@Database(version: 1, entities: [LocalPlaylistTrack])
abstract class AppDatabase extends FloorDatabase {
  PlaylistTrackDao get playlistTrackDao;
}
