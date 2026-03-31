import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:harry_poter_app/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load characters. Status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching characters: $e');
      rethrow;
    }
  }
}
