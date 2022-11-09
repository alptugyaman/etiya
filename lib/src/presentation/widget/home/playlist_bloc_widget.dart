import 'package:etiya/src/presentation/bloc/playlist/playlist_bloc.dart';
import 'package:etiya/src/presentation/widget/home/playlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This widget is a BlocBuilder that builds a PlaylistWidget when the state is PlaylistHasData, and
/// displays an error message when the state is PlaylistError.
class PlaylistBlocWidget extends StatelessWidget {
  const PlaylistBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        if (state is PlaylistError) {
          return Center(child: Text(state.message));
        } else if (state is PlaylistHasData) {
          /// Passing the state to the PlaylistWidget.
          return PlaylistWidget(state: state);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
