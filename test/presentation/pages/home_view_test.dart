import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:etiya/src/presentation/bloc/playlist_track/playlist_track_bloc.dart';
import 'package:etiya/src/domain/entites/playlist_track/added_by.dart';
import 'package:etiya/src/domain/entites/playlist_track/album.dart';
import 'package:etiya/src/domain/entites/playlist_track/artist.dart';
import 'package:etiya/src/domain/entites/playlist_track/external_ids.dart';
import 'package:etiya/src/domain/entites/playlist_track/external_urls.dart';
import 'package:etiya/src/domain/entites/playlist_track/images.dart';
import 'package:etiya/src/domain/entites/playlist_track/item.dart';
import 'package:etiya/src/domain/entites/playlist_track/playlist_track.dart';
import 'package:etiya/src/domain/entites/playlist_track/track.dart';
import 'package:etiya/src/presentation/widget/home/playlist_tracklist_bloc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockPlaylistTrackBloc extends MockBloc<PlaylistTrackEvent, PlaylistTrackState>
    implements PlaylistTrackBloc {}

class FakePlaylistTrackState extends Fake implements PlaylistTrackState {}

class FakePlaylistTrackEvent extends Fake implements PlaylistTrackEvent {}

void main() {
  late MockPlaylistTrackBloc mockPlaylistTrackBloc;

  late ScrollController scrollController;

  setUpAll(() async {
    HttpOverrides.global = null;
    registerFallbackValue(FakePlaylistTrackState());
    registerFallbackValue(FakePlaylistTrackEvent());

    final di = GetIt.instance;
    di.registerFactory(() => mockPlaylistTrackBloc);

    scrollController = ScrollController();
  });

  setUp(() {
    mockPlaylistTrackBloc = MockPlaylistTrackBloc();
  });

  const tExternalUrlsForAddedBy = ExternalUrls(
    spotify: "https://open.spotify.com/artist/4d3ZPCDmC82dHaVwnlS4mx",
  );

  const tExternalUrlsForAlbum = ExternalUrls(
    spotify: "https://open.spotify.com/album/7bchfd9ZihGesFniE7tM71",
  );

  List<Images>? tImages;

  tImages?.add(
    const Images(
      height: 640,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 640,
    ),
  );

  tImages?.add(
    const Images(
      height: 300,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 300,
    ),
  );

  tImages?.add(
    const Images(
      height: 64,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 64,
    ),
  );

  const tArtists = Artist(
    externalUrls: tExternalUrlsForAddedBy,
    id: "7bchfd9ZihGesFniE7tM71",
    name: "Velet",
    type: "artist",
    uri: "spotify:artist:7bchfd9ZihGesFniE7tM71",
  );

  final tAlbum = Album(
    albumType: "single",
    artists: const [tArtists],
    externalUrls: tExternalUrlsForAlbum,
    id: "4d3ZPCDmC82dHaVwnlS4mx",
    images: tImages,
    name: "Son Perde",
    releaseDate: "2022-11-04",
    releaseDatePrecision: "day",
    totalTracks: 4,
    type: "album",
    uri: "spotify:album:4d3ZPCDmC82dHaVwnlS4mx",
  );

  final tTrack = Track(
    album: tAlbum,
    artists: const [tArtists],
    discNumber: 1,
    durationMs: 140000,
    episode: false,
    explicit: false,
    externalIds: const ExternalIds(isrc: "QMDA62291437"),
    externalUrls:
        const ExternalUrls(spotify: "https://open.spotify.com/track/2Ti1LrtGjQYU2eBA9R7JGx"),
    id: "2Ti1LrtGjQYU2eBA9R7JGx",
    isLocal: false,
    isPlayable: true,
    name: "Uçurumlar",
    popularity: 54,
    previewUrl:
        "https://p.scdn.co/mp3-preview/7b5ee496d629ab6322512a4eb134338703866205?cid=f6a40776580943a7bc5173125a1e8832",
    track: true,
    trackNumber: 1,
    type: "track",
    uri: "spotify:track:2Ti1LrtGjQYU2eBA9R7JGx",
  );

  const tAddedBy = AddedBy(
    externalUrls: ExternalUrls(spotify: "https://open.spotify.com/user/"),
    id: "",
    type: "user",
    uri: "spotify:user:",
  );

  final tItems = Item(
    addedAt: "2022-11-04T08:05:35Z",
    addedBy: tAddedBy,
    isLocal: false,
    primaryColor: null,
    track: tTrack,
  );

  final tPlaylistTrack = PlaylistTrack(
    items: [tItems],
    limit: 1,
    next: null,
    offset: 0,
    previous: null,
    total: 100,
  );

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PlaylistTrackBloc>(
      create: (context) => mockPlaylistTrackBloc,
      child: ScreenUtilInit(builder: (context, _) {
        return MaterialApp(
          title: 'Widget Test',
          home: body,
        );
      }),
    );
  }

  testWidgets(
    'should show sizedbox when state is initial',
    (WidgetTester tester) async {
      when(() => mockPlaylistTrackBloc.state).thenReturn(PlaylistTrackInitial());

      await tester.pumpWidget(_makeTestableWidget(PlaylistTrackListBlocWidget(
        scrollController: scrollController,
      )));

      expect(find.byType(SizedBox), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show widget contain token list widget when state is has data',
    (WidgetTester tester) async {
      when(() => mockPlaylistTrackBloc.state).thenReturn(PlaylistTrackHasData(tPlaylistTrack));

      await tester.pumpWidget(_makeTestableWidget(PlaylistTrackListBlocWidget(
        scrollController: scrollController,
      )));

      expect(find.byType(PlaylistTrackListBlocWidget), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show widget contain text widget when state is has error',
    (WidgetTester tester) async {
      when(() => mockPlaylistTrackBloc.state).thenReturn(const PlaylistTrackError('Error'));

      await tester.pumpWidget(_makeTestableWidget(PlaylistTrackListBlocWidget(
        scrollController: scrollController,
      )));

      expect(find.byType(Text), equals(findsOneWidget));
    },
  );
}
