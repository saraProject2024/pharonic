import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/auth.dart';
import 'package:pharonic/templet.dart';

import 'favourite_card.dart';

class FavoritesList extends StatelessWidget {
  final List<String> placeIds;
  FavoritesList({super.key, required this.placeIds});
  final auth = Auth();

  @override
  Widget build(BuildContext context) {
    var userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
      stream: userStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator.
        } else {
          final favs = snapshot.data!['favs'];
          return ListView.builder(
            itemCount: placeIds.length,
            itemBuilder: (context, idx) {
              return FavouriteCard(
                placeId: placeIds[idx],
                isFavorite: favs.contains(placeIds[idx]),
              );
            },
          );
        }
      },
    );
  }
}
