import 'package:flutter/material.dart';
import 'package:pharonic/models/place_model.dart';

import 'widgets/place_details_body.dart';

class PlaceDetailView extends StatelessWidget {
  final PlaceModel place;
  const PlaceDetailView({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceDetailsBody(
        place: place,
      ),
    );
  }
}
