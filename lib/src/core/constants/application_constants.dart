import 'package:flutter_dotenv/flutter_dotenv.dart';

/// It's a class that contains constants that are used
/// throughout the application
class ApplicationConstants {
  /// It's a way to get the value of the environment variable `BASE_URL`
  static final baseUrl = '${dotenv.env['BASE_URL']}';

  /// It's a way to get the value of the environment variable `X-RapidAPI-Key`
  static final apiKey = '${dotenv.env['X-RapidAPI-Key']}';

  /// It's a way to get the value of the environment variable `X-RapidAPI-Host`
  static final apiHost = '${dotenv.env['X-RapidAPI-Host']}';

  /// It's a way to get the value of the environment variable `id`
  static final id = '${dotenv.env['id']}';
}
