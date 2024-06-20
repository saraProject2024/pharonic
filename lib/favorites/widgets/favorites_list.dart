import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/auth.dart';
import 'package:pharonic/templet.dart';

import 'favourite_card.dart';

class FavoritesList extends StatefulWidget {
  FavoritesList({super.key});

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
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
          log(favs.length.toString());
          print(favs);
          return ListView.builder(
            itemCount: favs.length,
            itemBuilder: (context, idx) {
              return FavouriteCard(
                placeId: favs[idx],
                isFavorite: favs.contains(favs[idx]),
              );
            },
          );
        }
      },
    );
  }
}
