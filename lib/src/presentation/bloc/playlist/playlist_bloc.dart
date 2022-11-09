import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist/playlist.dart';
import 'package:etiya/src/domain/usecases/get_playlist_tracks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';

/// A class that extends Bloc and implements the mapEventToState method
class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final GetPlaylist _getPlaylist;

  PlaylistBloc(this._getPlaylist) : super(PlaylistInitial()) {
    on<PlaylistEvent>((event, emit) async {
      emit(PlaylistLoading());

      final result = await _getPlaylist.getPlaylistData();

      result.fold(
        (failure) => emit(PlaylistError(failure.message)),
        (data) => emit(PlaylistHasData(data)),
      );
    });
  }
}
