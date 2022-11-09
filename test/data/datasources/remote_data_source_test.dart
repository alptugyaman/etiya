import 'dart:io';

import 'package:dio/dio.dart';
import 'package:etiya/src/core/constants/application_constants.dart';
import 'package:etiya/src/core/constants/url_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
  });

  group('get playlist tracks', () {
    test(
      'should return response code is 200',
      () async {
        dioAdapter.onGet(
          UrlContants.playlistTracks,
          (request) => request.reply(200, {'message': 'Done'}),
        );

        final response = await dio.get(
          UrlContants.playlistTracks,
          queryParameters: {
            'id': ApplicationConstants.id,
            'offset': 0,
            'limit': 1,
          },
        );

        expect(response.statusCode, 200);
      },
    );
  });
}
