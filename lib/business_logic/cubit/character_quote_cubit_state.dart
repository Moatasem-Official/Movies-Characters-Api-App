part of 'character_quote_cubit_cubit.dart';

sealed class CharacterQuoteCubitState extends Equatable {
  const CharacterQuoteCubitState();

  @override
  List<Object> get props => [];
}

class CharacterQuoteCubitInitial extends CharacterQuoteCubitState {}

class CharacterQuotesLoaded extends CharacterQuoteCubitState {
  final List<CharacterQuoteModel> charactersQuotes;
  const CharacterQuotesLoaded({required this.charactersQuotes});
  @override
  List<Object> get props => [charactersQuotes];
}

class CharacterError extends CharacterQuoteCubitState {
  final String errorMessage;
  const CharacterError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
