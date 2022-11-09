import 'package:etiya/src/presentation/bloc/playlist_track/playlist_track_bloc.dart';
import 'package:etiya/src/presentation/widget/home/playlist_tracklist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// It's a widget that displays a list of tracks in a playlist
class PlaylistTrackListBlocWidget extends StatelessWidget {
  const PlaylistTrackListBlocWidget({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistTrackBloc, PlaylistTrackState>(
      builder: (context, state) {
        if (state is PlaylistTrackInitial) {
          return const SizedBox.shrink();
        } else if (state is PlaylistTrackError) {
          return Center(child: Text(state.message));
        } else if (context.read<PlaylistTrackBloc>().playlistTrack?.items == null) {
          /// If the playlistTrack is null, show a CircularProgressIndicator.
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          /// It's a widget that displays a list of tracks in a playlist
          return PlaylistTrackListWidget(scrollController: scrollController);
        }
      },
    );
  }
}
