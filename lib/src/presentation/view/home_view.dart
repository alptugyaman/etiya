import 'package:etiya/main.dart';
import 'package:etiya/src/config/router/app_router.dart';
import 'package:etiya/src/core/components/text_form_field/custom_text_form_field.dart';
import 'package:etiya/src/presentation/bloc/playlist/playlist_bloc.dart';
import 'package:etiya/src/presentation/bloc/playlist_track/playlist_track_bloc.dart';
import 'package:etiya/src/presentation/widget/home/playlist_bloc_widget.dart';
import 'package:etiya/src/presentation/widget/home/playlist_tracklist_bloc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// `HomeView` is a stateful widget that displays a list of songs
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController scrollController;

  /// We're adding a listener to the scrollController, and we're fetching the playlist and playlist tracks
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(scrollListener);

    context.read<PlaylistBloc>().add(const OnPlaylistFetched());
    context.read<PlaylistTrackBloc>().add(const OnPlaylistTrackFetched());
  }

  /// It removes the listener from the scrollController.
  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(scrollListener);

    super.dispose();
  }

  /// If the user has scrolled to the bottom of the list and there are more tracks to load,
  /// then load more tracks
  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (context.read<PlaylistTrackBloc>().more) {
        context.read<PlaylistTrackBloc>().add(const OnPlaylistTrackFetched());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// It's a widget that displays the search icon.
        title: CustomTextFormField(
          isReadOnly: true,
          onTap: () => router.push(const SearchRouter()),
        ),

        /// It's a widget that displays the list of playlists.
        bottom: PreferredSize(
          preferredSize: Size(1.sw, .225.sw),
          child: const PlaylistBlocWidget(),
        ),
      ),

      /// It's a widget that displays the list of tracks.
      body: PlaylistTrackListBlocWidget(scrollController: scrollController),
    );
  }
}
