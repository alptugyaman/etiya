import 'package:etiya/src/core/components/list_tiles/custom_list_tiles.dart';
import 'package:etiya/src/presentation/bloc/search/search_bloc.dart';
import 'package:flutter/material.dart';

/// It's a stateless widget that takes in a state and returns a ListView.builder
class TracklistWidget extends StatelessWidget {
  const TracklistWidget({super.key, required this.state});

  final SearchHasData state;

  @override
  Widget build(BuildContext context) {
    /// It's a ListView.builder that takes in a state and returns a ListView.builder.
    return ListView.builder(
      itemCount: state.localPlaylistTrack.length,
      itemBuilder: (context, index) {
        final item = state.localPlaylistTrack[index]!;

        /// It's a CustomListTiles widget that takes in a image, songName, artists,
        /// duration and returns a CustomListTiles widget.
        return CustomListTiles(
          image: item.image!,
          songName: item.songName!,
          artists: item.artists!,
          duration: item.duration!,
        );
      },
    );
  }
}
