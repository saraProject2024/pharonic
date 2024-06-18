import 'package:flutter/material.dart';
import 'package:pharonic/models/place_model.dart';

import 'place_information.dart';

class PlaceDetailsBody extends StatelessWidget {
  final PlaceModel place;
  const PlaceDetailsBody({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          place.image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.4),
        ),
        PlaceInformation(
          title: place.title,
          description: place.description,
        ),
      ],
    );
  }
}
