import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/models/place_model.dart';
import 'package:pharonic/services/firebase_service.dart';

class TrendingPlaceCard extends StatelessWidget {
  final String image;
  final String title;
  final String country;
  final bool isFavourite;
  final String placeId;

  const TrendingPlaceCard({
    super.key,
    required this.image,
    required this.title,
    required this.country,
    required this.isFavourite,
    required this.placeId,
  });

  @override
  Widget build(BuildContext context) {
    return FillImageCard(
      width: 200,
      heightImage: 100,
      color: Colors.white70,
      imageProvider: NetworkImage(image),
      description: Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      country,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            LayoutBuilder(builder: (context, _) {
              if (isFavourite) {
                return IconButton(
                  color: Colors.red,
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    FirebaseService().toggleFavorite(placeId);
                  },
                );
              } else {
                return IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.favorite_outline_outlined),
                  onPressed: () {
                    FirebaseService().toggleFavorite(placeId);
                  },
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
