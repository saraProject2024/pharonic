import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/PlaceDetails/place_details.dart';
import 'package:pharonic/auth.dart';
import 'package:pharonic/models/place_model.dart';
import 'package:pharonic/services/firebase_service.dart';

import 'trending_place_card.dart';

class TrendingPlacesList extends StatefulWidget {
  const TrendingPlacesList({super.key});

  @override
  State<TrendingPlacesList> createState() => _TrendingPlacesListState();
}

class _TrendingPlacesListState extends State<TrendingPlacesList> {
  late Future<List<PlaceModel>> future;

  final auth = Auth();

  @override
  Widget build(BuildContext context) {
    var userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots();
    future = FirebaseService().getAllPlaces();
    return FutureBuilder<List<PlaceModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final places = snapshot.data ?? [];
          return StreamBuilder<DocumentSnapshot>(
            stream: userStream,
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator.
              } else {
                final favs = snapshot.data!['favs'];

                return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: places.length ?? 0,
                    itemBuilder: (context, idx) {
                      final currentPlace = places[idx];
                      final bool isFavourite = favs.contains(currentPlace.id);
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (
                                    context,
                                  ) =>
                                      PlaceDetailView(place: currentPlace),
                                ),
                              );
                            },
                            child: TrendingPlaceCard(
                              country: currentPlace.country,
                              image: currentPlace.image,
                              isFavourite: isFavourite,
                              placeId: currentPlace.id,
                              title: currentPlace.title,
                            ),
                          ),
                        ),
                      );
                    });
              }
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Oppps... error happened ${snapshot.error}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}


/**
 * 
 * ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, idx) {
                final currentPlace = places[idx];
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Center(
                    child: TrendingPlaceCard(
                      country: currentPlace.country,
                      image: currentPlace.image,
                      isFavourite: false,
                      placeId: currentPlace.id,
                      title: currentPlace.title,
                    ),
                  ),
                );
              });
 */