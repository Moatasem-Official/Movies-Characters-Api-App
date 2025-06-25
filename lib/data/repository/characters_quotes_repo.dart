import '../models/character_quote_model.dart';
import '../services/characters_quotes_api_services.dart';

class CharactersQuotesRepo {
  final CharactersQuotesApiServices charactersQuotesApiServices;

  CharactersQuotesRepo({required this.charactersQuotesApiServices});

  Future<List<CharacterQuoteModel>> fetchCharactersQuotes() async {
    final response = await charactersQuotesApiServices.getQuotesOfCharacters();

    if (response == null || response.isEmpty) {
      return [];
    }

    return response.map((e) => CharacterQuoteModel.fromJson(e)).toList();
  }
}
