import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:etiya/src/core/constants/url_constants.dart';
import 'package:etiya/src/core/network/network_exception.dart';
import 'package:etiya/src/domain/entites/playlist_track/added_by.dart';
import 'package:etiya/src/domain/entites/playlist_track/album.dart';
import 'package:etiya/src/domain/entites/playlist_track/artist.dart';
import 'package:etiya/src/domain/entites/playlist_track/external_ids.dart';
import 'package:etiya/src/domain/entites/playlist_track/external_urls.dart';
import 'package:etiya/src/domain/entites/playlist_track/images.dart';
import 'package:etiya/src/domain/entites/playlist_track/item.dart';
import 'package:etiya/src/domain/entites/playlist_track/playlist_track.dart';
import 'package:etiya/src/domain/entites/playlist_track/track.dart';
import 'package:etiya/src/domain/usecases/get_playlist_tracks.dart';
import 'package:etiya/src/presentation/bloc/playlist_track/playlist_track_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'playlist_tracklist_bloc_test.mocks.dart';

@GenerateMocks([GetPlaylist])
void main() {
  late MockGetPlaylist mockGetPlaylist;
  late PlaylistTrackBloc playlistTrackBloc;

  setUp(() {
    mockGetPlaylist = MockGetPlaylist();
    playlistTrackBloc = PlaylistTrackBloc(mockGetPlaylist);
  });

  const tExternalUrlsForAddedBy = ExternalUrls(
    spotify: "https://open.spotify.com/artist/5Pwc4xIPtQLFEnJriah9YJ",
  );

  const tExternalUrlsForAlbum = ExternalUrls(
    spotify: "https://open.spotify.com/album/04PEOM6kIEeq9lRp1asNP2",
  );

  List<Images>? tImage;

  tImage?.add(
    const Images(
      height: 640,
      url: "https://i.scdn.co/image/ab67616d0000b273ec96e006b8bdfc582610ec13",
      width: 640,
    ),
  );

  tImage?.add(
    const Images(
      height: 300,
      url: "https://i.scdn.co/image/ab67616d0000b273ec96e006b8bdfc582610ec13",
      width: 300,
    ),
  );

  tImage?.add(
    const Images(
      height: 64,
      url: "https://i.scdn.co/image/ab67616d0000b273ec96e006b8bdfc582610ec13",
      width: 64,
    ),
  );

  const tArtists = Artist(
    externalUrls: tExternalUrlsForAddedBy,
    id: "5Pwc4xIPtQLFEnJriah9YJ",
    name: "OneRepublic",
    type: "artist",
    uri: "spotify:artist:5Pwc4xIPtQLFEnJriah9YJ",
  );

  final tAlbum = Album(
    albumType: "single",
    artists: const [tArtists],
    externalUrls: tExternalUrlsForAlbum,
    id: "04PEOM6kIEeq9lRp1asNP2",
    images: tImage,
    name: "I Ain’t Worried (Music From The Motion Picture \"Top Gun: Maverick\")",
    releaseDate: "2022-05-13",
    releaseDatePrecision: "day",
    totalTracks: 1,
    type: "album",
    uri: "spotify:album:04PEOM6kIEeq9lRp1asNP2",
  );

  final tTrack = Track(
    album: tAlbum,
    artists: const [tArtists],
    discNumber: 1,
    durationMs: 148485,
    episode: false,
    explicit: false,
    externalIds: const ExternalIds(isrc: "USUM72206227"),
    externalUrls:
        const ExternalUrls(spotify: "https://open.spotify.com/track/4h9wh7iOZ0GGn8QVp4RAOB"),
    id: "4h9wh7iOZ0GGn8QVp4RAOB",
    isLocal: false,
    isPlayable: true,
    name: "I Ain't Worried",
    popularity: 95,
    previewUrl:
        "https://p.scdn.co/mp3-preview/657ab16e3f9b2d47ffbb2bc969db17ffcfc9198c?cid=f6a40776580943a7bc5173125a1e8832",
    track: true,
    trackNumber: 1,
    type: "track",
    uri: "spotify:track:4h9wh7iOZ0GGn8QVp4RAOB",
  );

  const tAddedBy = AddedBy(
    externalUrls: ExternalUrls(spotify: "https://open.spotify.com/user/"),
    id: "",
    type: "user",
    uri: "spotify:user:",
  );

  final tItems = Item(
    addedAt: "2022-10-01T12:52:03Z",
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

  test(
    'initial state should be empty',
    () {
      expect(playlistTrackBloc.state, PlaylistTrackInitial());
    },
  );

  blocTest<PlaylistTrackBloc, PlaylistTrackState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetPlaylist.getPlaylistTracks(0, 25)).thenAnswer((_) async => Right(tPlaylistTrack));
      return playlistTrackBloc;
    },
    act: (bloc) => bloc.add(const OnPlaylistTrackFetched()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      PlaylistTrackLoading(),
      PlaylistTrackHasData(tPlaylistTrack),
    ],
    verify: (bloc) {
      verify(mockGetPlaylist.getPlaylistTracks(0, 25));
    },
  );

  blocTest<PlaylistTrackBloc, PlaylistTrackState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(mockGetPlaylist.getPlaylistTracks(0, 25)).thenAnswer(
        (_) async => Left(
          NetworkExceptions.fromDioError(
            DioError(
              requestOptions: RequestOptions(
                path: UrlContants.playlistTracks,
              ),
            ),
          ),
        ),
      );
      return playlistTrackBloc;
    },
    act: (bloc) => bloc.add(const OnPlaylistTrackFetched()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      PlaylistTrackLoading(),
      const PlaylistTrackError('Unexpected error occurred'),
    ],
    verify: (bloc) {
      verify(mockGetPlaylist.getPlaylistTracks(0, 25));
    },
  );
}
