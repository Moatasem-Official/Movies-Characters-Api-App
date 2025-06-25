import '../../data/models/character_data_model.dart';
import '../widgets/CharacterDetailsPage/custom_char_details_bottom_sliv_list.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.characterDataModel});

  final CharacterDataModel characterDataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.75,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: characterDataModel.id.toString(),
                child: FadeInImage.assetNetwork(
                  placeholder:
                      'assets/animations/Animation - 1750347563563.gif',
                  fit: BoxFit.cover,
                  image: characterDataModel.image,
                ),
              ),
              title: Text(
                characterDataModel.name,
                style: TextStyle(
                  color: const Color.fromARGB(255, 14, 68, 95),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
          ),
          CustomBottomSlivers(characterDataModel: characterDataModel),
        ],
      ),
    );
  }
}
