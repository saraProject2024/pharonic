import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/templet.dart';

import 'favourite_card.dart';

class FavoritesList extends StatelessWidget {
  final List<String> placeIds;
  const FavoritesList({super.key, required this.placeIds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: placeIds.length,
        itemBuilder: (context, idx) {
          return FavouriteCard(placeId: placeIds[idx]);
        });
  }
}
