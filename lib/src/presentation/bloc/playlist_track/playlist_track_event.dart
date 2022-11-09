part of 'playlist_track_bloc.dart';

abstract class PlaylistTrackEvent extends Equatable {
  const PlaylistTrackEvent();

  @override
  List<Object> get props => [];
}

class OnPlaylistTrackFetched extends PlaylistTrackEvent {
  const OnPlaylistTrackFetched();

  @override
  List<Object> get props => [];
}
