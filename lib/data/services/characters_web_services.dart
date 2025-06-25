import 'package:dio/dio.dart';
import '../../constants/app_strings.dart';

class CharactersWebServices {
  Dio? dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getCharacters() async {
    try {
      Response response = await dio!.get('character');

      final data = response.data as Map<String, dynamic>;
      final characters = data['results'] as List;

      return characters;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
