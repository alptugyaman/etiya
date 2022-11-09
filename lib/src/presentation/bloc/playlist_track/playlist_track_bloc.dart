import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/playlist_track.dart';
import 'package:etiya/src/domain/usecases/get_playlist_tracks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'playlist_track_event.dart';
part 'playlist_track_state.dart';

/// It fetches the playlist tracks from the API and stores it in the local database
class PlaylistTrackBloc extends Bloc<PlaylistTrackEvent, PlaylistTrackState> {
  bool more = true;
  int offset = 0;
  final int limit = 25;
  bool _didFetch = false;

  PlaylistTrack? playlistTrack;
  final GetPlaylist _getPlaylist;

  PlaylistTrackBloc(this._getPlaylist) : super(PlaylistTrackInitial()) {
    /// Listening to the event and emitting the state.
    on<PlaylistTrackEvent>((event, emit) async {
      emit(PlaylistTrackLoading());

      /// Checking if the data is fetched. If it is fetched, it returns.
      if (_didFetch) return;
      _didFetch = true;

      /// Fetching the playlist tracks from the API.
      final result = await _getPlaylist.getPlaylistTracks(offset, limit);

      /// Checking if the result is a failure or a success. If it is a failure, it emits the error state.
      /// If it is a success, it emits the data state.
      result.fold(
        (failure) => emit(PlaylistTrackError(failure.message)),
        (data) async {
          /// Checking if the playlistTrack is null. If it is null, it assigns the data to the
          /// playlistTrack.
          /// Then it inserts the data to the local database.
          if (playlistTrack == null) {
            playlistTrack = data;

            for (final i in data.items!) {
              _getPlaylist
                  .insertPlaylistTracksToLocal(PlaylistTrack.remoteToLocal(i));
            }
          }

          /// If the data is not empty, then add the items to the list, and if the data is empty, then
          /// set the more variable to false
          ///
          /// Args:
          ///   isEmpty (data): If the data is empty, it means that there is no more data to load.
          else if (data.items!.isEmpty) {
            more = false;
          }

          /// Adding the items to the list and inserting the data to the local database.
          else {
            playlistTrack!.items!.addAll(data.items!);
            for (final i in data.items!) {
              _getPlaylist
                  .insertPlaylistTracksToLocal(PlaylistTrack.remoteToLocal(i));
            }
          }

          /// It emits the data state.
          emit(PlaylistTrackHasData(playlistTrack!));

          /// Increasing the offset by the limit and setting the _didFetch to false.
          offset += limit;
          _didFetch = false;
        },
      );
    });
  }
}
