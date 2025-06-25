import 'business_logic/cubit/character_cubit.dart';
import 'business_logic/cubit/character_quote_cubit_cubit.dart';
import 'constants/app_strings.dart';
import 'data/models/character_data_model.dart';
import 'data/models/character_quote_model.dart';
import 'data/repository/characters_quotes_repo.dart';
import 'data/repository/characters_repository.dart';
import 'data/services/characters_quotes_api_services.dart';
import 'data/services/characters_web_services.dart';
import 'presentation/screens/character_details_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterCubit charactersCubit;
  late CharactersRepository charactersRepository;
  late CharactersQuotesRepo charactersQuotesRepo;
  AppRouter() {
    charactersRepository = CharactersRepository(
      charactersWebServices: CharactersWebServices(),
    );
    charactersQuotesRepo = CharactersQuotesRepo(
      charactersQuotesApiServices: CharactersQuotesApiServices(),
    );
  }
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.charactersScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<CharacterCubit>(
                create:
                    (BuildContext context) =>
                        CharacterCubit(charactersRepository),
                child: HomeScreen(),
              ),
        );
      case AppStrings.characterDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;

        final character = args['character'] as CharacterDataModel;

        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<CharacterQuoteCubitCubit>(
                create:
                    (BuildContext context) =>
                        CharacterQuoteCubitCubit(charactersQuotesRepo),
                child: CharacterDetailsScreen(characterDataModel: character),
              ),
        );
    }
    return null;
  }
}
