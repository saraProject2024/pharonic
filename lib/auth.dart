import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:developer' as logger;

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final user = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    logger.log(user.user!.uid.toString());
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String fName,
      required String lName}) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.user!.uid)
        .set({
      "email": email,
      "f_name": fName,
      "l_name": lName,
      "favs": [],
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
