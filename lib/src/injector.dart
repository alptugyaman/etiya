import 'package:etiya/src/core/constants/db_constants.dart';
import 'package:etiya/src/core/network/network_manager.dart';
import 'package:etiya/src/data/datasources/local/app_database.dart';
import 'package:etiya/src/data/datasources/remote/remote_data_source.dart';
import 'package:etiya/src/data/repositories/playlist_track_repository_impl.dart';
import 'package:etiya/src/domain/repositories/playlist_track_repository.dart';
import 'package:etiya/src/domain/usecases/get_playlist_tracks.dart';
import 'package:etiya/src/presentation/bloc/playlist/playlist_bloc.dart';
import 'package:etiya/src/presentation/bloc/playlist_track/playlist_track_bloc.dart';
import 'package:etiya/src/presentation/bloc/search/search_bloc.dart';

import 'package:get_it/get_it.dart';

/// Register all the dependencies that are needed for the app to run.
final injector = GetIt.instance;

/// It initializes the dependency injection.
Future<void> init() async {
  //* DB
  final database =
      await $FloorAppDatabase.databaseBuilder(DBConstants.databaseName).build();
  injector.registerSingleton<AppDatabase>(database);

  //* BLOC
  injector.registerFactory(() => PlaylistTrackBloc(injector()));
  injector.registerFactory(() => PlaylistBloc(injector()));
  injector.registerFactory(() => SearchBloc(injector()));

  //* USECASE
  injector.registerLazySingleton(() => GetPlaylist(injector()));

  //* REPOSITORY
  injector.registerLazySingleton<PlaylistRepository>(() {
    return PlaylistRepositoryImpl(
      remoteDataSource: injector(),
      appDatabase: injector(),
    );
  });

  //* DATA SOURCE
  injector.registerLazySingleton<RemoteDataSource>(() {
    return RemoteDataSourceImpl(
      networkManager: injector(),
    );
  });

  //* NETWORK
  injector.registerLazySingleton(() => NetworkManager());
}
