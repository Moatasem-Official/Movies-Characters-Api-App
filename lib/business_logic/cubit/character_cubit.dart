import 'character_state.dart';
import '../../data/models/character_data_model.dart';
import '../../data/repository/characters_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.charactersRepository) : super(CharacterLoading());

  final CharactersRepository charactersRepository;
  List<CharacterDataModel> characters = [];

  List<CharacterDataModel> fetchCharacters() {
    emit(CharacterLoading());
    try {
      charactersRepository.fetchCharactersData().then((characters) {
        emit(CharacterLoaded(characters: characters));
        this.characters = characters;
      });
    } catch (e) {
      emit(CharacterError(errorMessage: e.toString()));
    }
    return characters;
  }

  List<CharacterDataModel> searchCharacters(String searchText) {
    final filteredCharacters =
        characters.where((character) {
          return character.name.toLowerCase().startsWith(
            searchText.toLowerCase(),
          );
        }).toList();
    return filteredCharacters;
  }
}
