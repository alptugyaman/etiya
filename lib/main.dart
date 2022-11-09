import 'package:auto_route/auto_route.dart';
import 'package:etiya/src/config/router/app_router.dart';
import 'package:etiya/src/config/router/navigator_observers.dart';
import 'package:etiya/src/core/constants/image_constants.dart';
import 'package:etiya/src/core/theme/app_theme.dart';
import 'package:etiya/src/injector.dart' as di;
import 'package:etiya/src/presentation/bloc/playlist/playlist_bloc.dart';
import 'package:etiya/src/presentation/bloc/playlist_track/playlist_track_bloc.dart';
import 'package:etiya/src/presentation/bloc/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> main() async {
  /// Initializing the app by initializing the dependency injection and loading
  /// the environment variables.
  await _initalize();

  runApp(const MyApp());
}

/// _initalize() is a function that initializes the app by
/// initializing the dependency injection and
/// loading the environment variables
Future<void> _initalize() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Precaching the logo so that it is loaded before the app starts.
  await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, SVGConstants.logo),
    null,
  );

  /// Initializing the dependency injection.
  await di.init();

  /// Loading the environment variables from the .env file.
  await dotenv.load();
}

/// Creating an instance of the AppRouter class.
final router = AppRouter();

/// `MyApp` is a `StatelessWidget` that uses `ScreenUtilInit` to initialize
/// `ScreenUtil` and then uses  `MaterialApp.router` to create a `MaterialApp`
/// with a `title`, `theme`, `routerDelegate`, and `routeInformationParser`
class MyApp extends StatelessWidget {
  /// A named constructor that is used to create a const instance of the class.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// Creating a bloc provider for each bloc.
      providers: [
        BlocProvider(create: (_) => di.injector<PlaylistBloc>()),
        BlocProvider(create: (_) => di.injector<PlaylistTrackBloc>()),
        BlocProvider(create: (_) => di.injector<SearchBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (context, _) {
          return MaterialApp.router(
            // Title
            title: 'Edita',

            //Theme
            theme: AppTheme.theme,

            //Route
            routerDelegate: AutoRouterDelegate(
              router,
              navigatorObservers: () => [NavigatorObservers()],
            ),
            routeInformationParser: router.defaultRouteParser(),

            /// Localizations
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
