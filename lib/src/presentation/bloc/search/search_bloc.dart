import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:etiya/src/domain/usecases/get_playlist_tracks.dart';

part 'search_event.dart';
part 'search_state.dart';

/// It's a Bloc class that takes in a SearchEvent and emits a SearchState
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetPlaylist _getPlaylist;
  SearchBloc(this._getPlaylist) : super(SearchInitial()) {
    on<OnLocalPlaylistTrackFetched>((event, emit) async {
      emit(SearchLoading());
      try {
        final result =
            await _getPlaylist.getLocalPlaylistTracks('${event.input}%');
        emit(SearchHasData(result!));
      } on Exception catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
