import 'package:equatable/equatable.dart';
import '../../data/models/character_data_model.dart';
import '../../data/models/character_quote_model.dart';

sealed class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  late List<CharacterDataModel> characters;
  CharacterLoaded({required this.characters});

  @override
  List<Object?> get props => [characters];
}

class CharacterQuotesLoaded extends CharacterState {
  late List<CharacterQuoteModel> charactersQuotes;
  CharacterQuotesLoaded({required this.charactersQuotes});

  @override
  List<Object?> get props => [charactersQuotes];
}

class CharacterError extends CharacterState {
  late String errorMessage;
  CharacterError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class InternetError extends CharacterState {}
