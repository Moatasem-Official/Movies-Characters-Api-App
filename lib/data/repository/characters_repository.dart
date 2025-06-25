import '../models/character_data_model.dart';
import '../services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<CharacterDataModel>> fetchCharactersData() async {
    final response = await charactersWebServices.getCharacters();

    return response
        .map((e) => CharacterDataModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
