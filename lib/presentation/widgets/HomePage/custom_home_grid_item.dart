import '../../../constants/app_strings.dart';
import '../../../data/models/character_data_model.dart';
import '../../../data/models/character_quote_model.dart';
import 'package:flutter/material.dart';

class CharacterContainerGridItem extends StatelessWidget {
  const CharacterContainerGridItem({
    super.key,
    required this.index,
    required this.characterDataModel,
  });
  final CharacterDataModel characterDataModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap:
            () => Navigator.pushNamed(
              context,
              AppStrings.characterDetailsScreen,
              arguments: {'character': characterDataModel},
            ),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: GridTile(
            footer: Container(
              decoration: BoxDecoration(
                color: Colors.black54.withValues(alpha: .5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  characterDataModel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: Hero(
              tag: characterDataModel.id.toString(),
              child:
                  characterDataModel.image.isEmpty
                      ? Image.asset('assets/images/saadi.png')
                      : FadeInImage.assetNetwork(
                        placeholder:
                            'assets/animations/Animation - 1750347563563.gif',
                        fit: BoxFit.cover,
                        image: characterDataModel.image,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
