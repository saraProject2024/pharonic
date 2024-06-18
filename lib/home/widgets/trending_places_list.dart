import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/models/place_model.dart';
import 'package:pharonic/services/firebase_service.dart';

class TrendingPlacesList extends StatefulWidget {
  const TrendingPlacesList({super.key});

  @override
  State<TrendingPlacesList> createState() => _TrendingPlacesListState();
}

class _TrendingPlacesListState extends State<TrendingPlacesList> {
  late Future<List<PlaceModel>> future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = FirebaseService().getAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PlaceModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final places = snapshot.data ?? [];
          return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, idx) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Center(
                    child: FillImageCard(
                      width: 200,
                      heightImage: 100,
                      color: Colors.white70,
                      imageProvider: NetworkImage(places[idx].image),
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
                                      places[idx].country,
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
                                      places[idx].title,
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
                            IconButton(
                              color: Colors.black,
                              icon: const Icon(Icons.favorite_outline_outlined),
                              onPressed: () {
                                /**
                                       * Just pass the place id from firestore here to toggle the favorite status.
                                       */
                                FirebaseService()
                                    .toggleFavorite(places[idx].id);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const Templet()),
                                // );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
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
