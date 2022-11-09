part of 'playlist_track_bloc.dart';

abstract class PlaylistTrackState extends Equatable {
  const PlaylistTrackState();

  @override
  List<Object> get props => [];
}

class PlaylistTrackInitial extends PlaylistTrackState {}

class PlaylistTrackLoading extends PlaylistTrackState {}

class PlaylistTrackEmpty extends PlaylistTrackState {}

class PlaylistTrackError extends PlaylistTrackState {
  const PlaylistTrackError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class PlaylistTrackHasData extends PlaylistTrackState {
  const PlaylistTrackHasData(this.playlistTrack);
  final PlaylistTrack playlistTrack;

  @override
  List<Object> get props => [playlistTrack];
}
