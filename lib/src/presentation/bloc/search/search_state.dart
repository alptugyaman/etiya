part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  const SearchError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class SearchHasData extends SearchState {
  const SearchHasData(this.localPlaylistTrack);
  final List<LocalPlaylistTrack?> localPlaylistTrack;

  @override
  List<Object> get props => [localPlaylistTrack];
}
