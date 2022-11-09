part of 'playlist_bloc.dart';

abstract class PlaylistState extends Equatable {
  const PlaylistState();

  @override
  List<Object> get props => [];
}

class PlaylistInitial extends PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistEmpty extends PlaylistState {}

class PlaylistError extends PlaylistState {
  const PlaylistError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class PlaylistHasData extends PlaylistState {
  const PlaylistHasData(this.playlistData);
  final Playlist playlistData;

  @override
  List<Object> get props => [playlistData];
}
