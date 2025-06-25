import 'package:flutter/material.dart';

class BuildCustomSliverListItem extends StatelessWidget {
  final String baseString;
  final String apiString;

  const BuildCustomSliverListItem({
    super.key,
    required this.baseString,
    required this.apiString,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black), // أو أي لون عايزه
      child: RichText(
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        text: TextSpan(
          children: [
            TextSpan(
              text: baseString,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: apiString,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
