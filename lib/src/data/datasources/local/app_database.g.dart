// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PlaylistTrackDao? _playlistTrackDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `LocalPlaylistTrack` (`image` TEXT, `songName` TEXT, `artists` TEXT, `duration` INTEGER, PRIMARY KEY (`image`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PlaylistTrackDao get playlistTrackDao {
    return _playlistTrackDaoInstance ??=
        _$PlaylistTrackDao(database, changeListener);
  }
}

class _$PlaylistTrackDao extends PlaylistTrackDao {
  _$PlaylistTrackDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _localPlaylistTrackInsertionAdapter = InsertionAdapter(
            database,
            'LocalPlaylistTrack',
            (LocalPlaylistTrack item) => <String, Object?>{
                  'image': item.image,
                  'songName': item.songName,
                  'artists': item.artists,
                  'duration': item.duration
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LocalPlaylistTrack>
      _localPlaylistTrackInsertionAdapter;

  @override
  Future<List<LocalPlaylistTrack>?> getPlaylistTracks(String input) async {
    return _queryAdapter.queryList(
        'SELECT * from LocalPlaylistTrack WHERE (artists LIKE ?1 OR songName LIKE ?1)',
        mapper: (Map<String, Object?> row) => LocalPlaylistTrack(image: row['image'] as String?, songName: row['songName'] as String?, artists: row['artists'] as String?, duration: row['duration'] as int?),
        arguments: [input]);
  }

  @override
  Future<void> insertPlaylistTracks(
      LocalPlaylistTrack localPlaylistTrack) async {
    await _localPlaylistTrackInsertionAdapter.insert(
        localPlaylistTrack, OnConflictStrategy.replace);
  }
}
