import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/PlaceDetails/place_details.dart';
import 'package:pharonic/models/place_model.dart';
import 'package:pharonic/services/firebase_service.dart';
import 'package:pharonic/templet.dart';

class FavouriteCard extends StatelessWidget {
  final String placeId;
  final bool isFavorite;

  FavouriteCard({
    super.key,
    required this.placeId,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    Future getPlaceData =
        FirebaseFirestore.instance.collection('places').doc(placeId).get();
    return FutureBuilder(
        future: getPlaceData,
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text('Error: ${snapShot.error}');
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            ); // Show a loading indicator.
          } else {
            final placeData = snapShot.data;
            PlaceModel place = PlaceModel(
              country: placeData['country'],
              description: placeData['description'],
              id: placeId,
              image: placeData['image'],
              searchable: '',
              title: placeData['title'],
            );

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        PlaceDetailView(place: place),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Center(
                  child: FillImageCard(
                    width: double.infinity,
                    heightImage: 100,
                    color: Colors.white70,
                    imageProvider: NetworkImage(placeData['image']),
                    description: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  placeData['title'],
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
                                  placeData['country'],
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
                          IconButton(
                            color: Colors.black,
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => const Templet()),
                              // );
                              FirebaseService().toggleFavorite(placeId);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
