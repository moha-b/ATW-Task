import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final collection = FirebaseFirestore.instance.collection("USER");
  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> setUserData({required UserModel userModel}) async {
    try {
      await collection.doc(userModel.userId).set(userModel.toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot userData =
          await collection.doc(userCredential.user!.uid).get();

      if (!userData.exists) {
        UserModel userModel = UserModel(
          userId: userCredential.user!.uid,
          email: userCredential.user?.email,
        );

        await setUserData(userModel: userModel);
        return userModel;
      }

      Map<String, dynamic> userDataMap =
          userData.data() as Map<String, dynamic>;
      UserModel userModel = UserModel.fromDocument(userDataMap);
      return userModel;
    } on FirebaseAuth catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return UserModel(userId: user.user!.uid, email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
