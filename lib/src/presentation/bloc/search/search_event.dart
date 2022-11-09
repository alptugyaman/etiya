part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnLocalPlaylistTrackFetched extends SearchEvent {
  const OnLocalPlaylistTrackFetched(this.input);

  final String input;

  @override
  List<Object> get props => [];
}
