import 'package:etiya/src/core/components/list_tiles/custom_list_tiles.dart';
import 'package:etiya/src/presentation/bloc/playlist_track/playlist_track_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// It's a ListView that displays a list of CustomListTiles
class PlaylistTrackListWidget extends StatelessWidget {
  const PlaylistTrackListWidget({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    /// It's a ListView that displays a list of CustomListTiles
    return ListView(
      controller: scrollController,
      key: const Key('TEST'),
      children: [
        /// It's a list of CustomListTiles.
        ...context.read<PlaylistTrackBloc>().playlistTrack!.items!.map((e) {
          return CustomListTiles(
            image: e.track!.album!.images![0].url!,
            songName: e.track!.album!.name!,
            artists: e.track!.album!.artists!
                .map((e) => e.name!)
                .toList()
                .join(', '),
            duration: e.track!.durationMs!,
          );
        }).toList(),

        /// It's a CircularProgressIndicator that shows when the list is loading.
        if (context.read<PlaylistTrackBloc>().more) ...[
          Container(
            alignment: Alignment.center,
            height: 80,
            child: const CircularProgressIndicator.adaptive(),
          )
        ]
      ],
    );
  }
}
