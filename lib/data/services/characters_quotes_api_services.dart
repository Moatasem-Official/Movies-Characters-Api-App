import 'package:dio/dio.dart';
import '../../constants/app_strings.dart';

class CharactersQuotesApiServices {
  Dio? dio;

  CharactersQuotesApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrlQuotes,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<Map<String, dynamic>>?> getQuotesOfCharacters() async {
    try {
      Response response = await dio!.get('quotes/20');

      final charactersQuotes = response.data as List<dynamic>;

      return charactersQuotes.cast<Map<String, dynamic>>();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
