import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharonic/favorites/favourite.dart';
import 'package:pharonic/models/place_model.dart';

final firestore = FirebaseFirestore.instance;
final currentUser = FirebaseAuth.instance.currentUser;

class FirebaseService {
  static List<String> favouritePlaces = [];

  static void getFav() async {
    final userDoc =
        await firestore.collection('users').doc(currentUser?.uid).get();
    favouritePlaces = userDoc.data()?['favs'] ?? [];
  }

  static void createUserDoc(String fName, String lName, String email) {
    firestore.collection('users').add({
      "email": email,
      "f_name": fName,
      "l_name": lName,
      "favs": [],
    });
  }

  void toggleFavorite(String placeId) async {
    if (currentUser == null) return;
    String? currentUserId = currentUser?.uid;
    final userDoc = await firestore.collection('user').doc(currentUserId).get();
    final currentUserData = userDoc.data();
    List<String> favs = currentUserData!['favs'];
    if (favs.contains(placeId)) {
      favs.remove(placeId);
    } else {
      favs.add(placeId);
    }

    firestore.collection('users').doc(currentUserId).update({
      favs: favs,
    });
  }

  Future<List<PlaceModel>> searchPlaceByTitle(String searchTerm) async {
    String lowerSearchTerm = searchTerm.toLowerCase();
    final result = await firestore
        .collection('places')
        .where('searchable', isGreaterThanOrEqualTo: lowerSearchTerm)
        .where('searchable', isLessThanOrEqualTo: lowerSearchTerm + '\uf8ff')
        .get();
    List<PlaceModel> resultPlaces = [];

    for (var doc in result.docs) {
      final data = doc.data();
      final newPlace = PlaceModel(
        country: data['country'],
        description: data['description'],
        image: data['image'],
        searchable: data['searchable'],
        title: data['title'],
      );
      resultPlaces.add(newPlace);
    }

    log("search done ${resultPlaces.length}");

    return resultPlaces;
  }

  Future<List<PlaceModel>> getAllPlaces(String searchTerm) async {
    String lowerSearchTerm = searchTerm.toLowerCase();
    final result = await firestore.collection('places').get();
    List<PlaceModel> resultPlaces = [];

    for (var doc in result.docs) {
      final data = doc.data();
      final newPlace = PlaceModel(
        country: data['country'],
        description: data['description'],
        image: data['image'],
        searchable: data['searchable'],
        title: data['title'],
      );
      resultPlaces.add(newPlace);
    }

    return resultPlaces;
  }

  Future<PlaceModel> getPlaceById(String placeId) async {
    final placeDoc = await firestore.collection('places').doc(placeId).get();
    final placeData = placeDoc.data();
    final placeObject = PlaceModel(
      country: placeData?['country'],
      description: placeData?['description'],
      image: placeData?['image'],
      searchable: placeData?['searchable'],
      title: placeData?['title'],
    );
    return placeObject;
  }
}
