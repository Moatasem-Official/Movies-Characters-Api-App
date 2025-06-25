import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/character_quote_model.dart';
import '../../data/repository/characters_quotes_repo.dart';

part 'character_quote_cubit_state.dart';

class CharacterQuoteCubitCubit extends Cubit<CharacterQuoteCubitState> {
  CharacterQuoteCubitCubit(this.charactersQuotesRepo)
    : super(CharacterQuoteCubitInitial());
  final CharactersQuotesRepo charactersQuotesRepo;

  List<CharacterQuoteModel> charactersQuotes = [];

  List<CharacterQuoteModel> fetchCharactersQuotes() {
    try {
      charactersQuotesRepo.fetchCharactersQuotes().then((charactersQuotes) {
        emit(CharacterQuotesLoaded(charactersQuotes: charactersQuotes));
        this.charactersQuotes = charactersQuotes;
      });
    } catch (e) {
      emit(CharacterError(errorMessage: e.toString()));
    }

    return charactersQuotes;
  }
}
