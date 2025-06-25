import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../business_logic/cubit/character_quote_cubit_cubit.dart';
import '../../../data/models/character_data_model.dart';
import '../../../data/models/character_quote_model.dart';
import 'char_bottom_sliver_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSlivers extends StatefulWidget {
  CustomBottomSlivers({super.key, required this.characterDataModel});
  final CharacterDataModel characterDataModel;

  @override
  State<CustomBottomSlivers> createState() => _CustomBottomSliversState();
}

class _CustomBottomSliversState extends State<CustomBottomSlivers> {
  @override
  void initState() {
    super.initState();
    context.read<CharacterQuoteCubitCubit>().fetchCharactersQuotes();
  }

  Widget displayRandomQuote(state) {
    var quotes = state.charactersQuotes;
    if (quotes.isNotEmpty) {
      var randomQuote = quotes[Random().nextInt(quotes.length - 1)];
      return Align(
        alignment: Alignment.center,
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromARGB(255, 27, 133, 162),
            fontSize: 20,
            shadows: [
              Shadow(
                color: Color.fromARGB(255, 2, 31, 56),
                offset: Offset(5, 5),
                blurRadius: 20,
              ),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FadeAnimatedText(
                randomQuote.quote,
                duration: const Duration(seconds: 2),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BuildCustomSliverListItem(
            baseString: 'Status : ',
            apiString: widget.characterDataModel.status,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BuildCustomSliverListItem(
            baseString: 'Species : ',
            apiString: widget.characterDataModel.species,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BuildCustomSliverListItem(
            baseString: 'Gender : ',
            apiString: widget.characterDataModel.gender,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BuildCustomSliverListItem(
            baseString: 'Origin : ',
            apiString: widget.characterDataModel.origin,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BuildCustomSliverListItem(
            baseString: 'Location : ',
            apiString: widget.characterDataModel.location,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BuildCustomSliverListItem(
            baseString: 'Date of Birth : ',
            apiString: widget.characterDataModel.birthday,
          ),
        ),
        BlocBuilder<CharacterQuoteCubitCubit, CharacterQuoteCubitState>(
          builder: (context, state) {
            return state is CharacterQuotesLoaded
                ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: displayRandomQuote(state),
                )
                : const Center(child: CircularProgressIndicator());
          },
        ),
        const SizedBox(height: 800),
      ]),
    );
  }
}
