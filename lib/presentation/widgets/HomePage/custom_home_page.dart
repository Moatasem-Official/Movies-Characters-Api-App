import '../../../business_logic/cubit/character_cubit.dart';
import '../../../business_logic/cubit/character_state.dart';
import '../../../data/repository/characters_repository.dart';
import '../../../data/services/characters_web_services.dart';
import 'custom_home_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomePage extends StatelessWidget {
  CustomHomePage({super.key, required this.searchText});

  CharactersWebServices charactersWebServices = CharactersWebServices();

  late CharactersRepository charactersRepository = CharactersRepository(
    charactersWebServices: charactersWebServices,
  );

  final String searchText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: [
          BlocBuilder<CharacterCubit, CharacterState>(
            builder:
                (context, state) =>
                    state is CharacterLoading
                        ? SliverToBoxAdapter(
                          child: Center(
                            child: const CircularProgressIndicator(),
                          ),
                        )
                        : state is CharacterLoaded
                        ? (() {
                          final filteredCharacters =
                              state.characters.where((character) {
                                return character.name.toLowerCase().startsWith(
                                  searchText.toLowerCase(),
                                );
                              }).toList();

                          if (filteredCharacters.isEmpty) {
                            return SliverToBoxAdapter(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: const [
                                      Icon(
                                        Icons.error,
                                        size: 70,
                                        color: Colors.red,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'No Characters Found !',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }

                          return CustomGridSliver(
                            characters: filteredCharacters,
                          );
                        })()
                        : SliverToBoxAdapter(child: const Text('Error')),
          ),
        ],
      ),
    );
  }
}
