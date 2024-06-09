import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

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

  searchPlaceByTitle(String searchTerm) async {
    String lowerSearchTerm = searchTerm.toLowerCase();
    final result = await firestore
        .collection('places')
        .where('searchable', isGreaterThanOrEqualTo: lowerSearchTerm)
        .where('searchable', isLessThanOrEqualTo: lowerSearchTerm + '\uf8ff')
        .get();
    log(result.docs.length.toString());
    return result.docs;
  }
}
