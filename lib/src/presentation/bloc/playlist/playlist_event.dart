part of 'playlist_bloc.dart';

abstract class PlaylistEvent extends Equatable {
  const PlaylistEvent();

  @override
  List<Object> get props => [];
}

class OnPlaylistFetched extends PlaylistEvent {
  const OnPlaylistFetched();

  @override
  List<Object> get props => [];
}
