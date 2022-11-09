// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    HomeRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    TrackRouter.name: (routeData) {
      final args = routeData.argsAs<TrackRouterArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: TrackView(
          key: args.key,
          localPlaylistTrack: args.localPlaylistTrack,
        ),
      );
    },
    SearchRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SearchView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRouter.name,
          path: '/',
        ),
        RouteConfig(
          HomeRouter.name,
          path: '/home',
        ),
        RouteConfig(
          TrackRouter.name,
          path: '/track',
        ),
        RouteConfig(
          SearchRouter.name,
          path: '/search',
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRouter extends PageRouteInfo<void> {
  const SplashRouter()
      : super(
          SplashRouter.name,
          path: '/',
        );

  static const String name = 'SplashRouter';
}

/// generated route for
/// [HomeView]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '/home',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [TrackView]
class TrackRouter extends PageRouteInfo<TrackRouterArgs> {
  TrackRouter({
    Key? key,
    required LocalPlaylistTrack localPlaylistTrack,
  }) : super(
          TrackRouter.name,
          path: '/track',
          args: TrackRouterArgs(
            key: key,
            localPlaylistTrack: localPlaylistTrack,
          ),
        );

  static const String name = 'TrackRouter';
}

class TrackRouterArgs {
  const TrackRouterArgs({
    this.key,
    required this.localPlaylistTrack,
  });

  final Key? key;

  final LocalPlaylistTrack localPlaylistTrack;

  @override
  String toString() {
    return 'TrackRouterArgs{key: $key, localPlaylistTrack: $localPlaylistTrack}';
  }
}

/// generated route for
/// [SearchView]
class SearchRouter extends PageRouteInfo<void> {
  const SearchRouter()
      : super(
          SearchRouter.name,
          path: '/search',
        );

  static const String name = 'SearchRouter';
}
