import '../../../data/models/character_data_model.dart';
import '../../../data/models/character_quote_model.dart';
import 'custom_home_grid_item.dart';
import 'package:flutter/material.dart';

class CustomGridSliver extends StatefulWidget {
  const CustomGridSliver({
    super.key,
    required this.characters,
  });

  final List<CharacterDataModel> characters;

  @override
  State<CustomGridSliver> createState() => _CustomGridSliverState();
}

class _CustomGridSliverState extends State<CustomGridSliver> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2 / 3,
            ),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder:
                (context, index) => CharacterContainerGridItem(
                  index: index,
                  characterDataModel: widget.characters[index],
                ),
            itemCount: widget.characters.length,
          ),
        ),
      ),
    );
  }
}
