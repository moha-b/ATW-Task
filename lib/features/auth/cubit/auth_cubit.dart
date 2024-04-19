import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../../core/caching/caching.dart';
import '../../../core/navigation/navigation.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository repo;

  bool visibility = true;
  bool check = true;

  static AuthCubit get instance =>
      BlocProvider.of(NavigationHelper.navigatorKey.currentContext!);

  AuthCubit(this.repo) : super(Unauthenticated());

  void changePasswordVisibility() {
    visibility = !visibility;
    emit(Unauthenticated());
  }

  void changeCheck(bool? value) {
    check = value!;
    emit(Unauthenticated());
  }

  void login({required String email, required String password}) async {
    emit(LoadingState());
    if (email.isEmpty) {
      return null;
    }
    try {
      var user = await repo.signIn(password: password, email: email);
      if (user != null) {
        CachingHelper.instance!.writeData(CachingKey.IS_LOGIN, true);
        NavigationHelper.navigateTo(AppRoute.HOME, clean: true);
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    } on FirebaseException catch (e) {
      String errorMessage = "An error occurred. Please try again later.";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Invalid password.";
      }
      log(e.toString(), error: e);
      NavigationHelper.scaffoldState.currentState
          ?.showSnackBar(SnackBar(content: Text(errorMessage)));
      emit(AuthenticationFailed());
    }
  }

  void signUp({required String email, required String password}) async {
    emit(LoadingState());
    try {
      var user = await repo.signUp(email: email, password: password);
      if (user != null) {
        NavigationHelper.scaffoldState.currentState?.showSnackBar(
            const SnackBar(content: Text("Signed Up Successfully")));
        await Future.delayed(Duration(seconds: 3));
        NavigationHelper.navigateTo(AppRoute.LOGIN, clean: true);
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    } on FirebaseException catch (e) {
      String errorMessage = "An error occurred. Please try again later.";
      if (e.code == 'weak-password') {
        errorMessage = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        errorMessage = "The account already exists for that email.";
      }
      log(e.toString(), error: e);
      NavigationHelper.scaffoldState.currentState
          ?.showSnackBar(SnackBar(content: Text(errorMessage)));
      emit(AuthenticationFailed());
    }
  }

  void logOut() async {
    await repo.logout();
    NavigationHelper.navigateTo(AppRoute.LOGIN, clean: true);
    CachingHelper.instance?.writeData(CachingKey.IS_LOGIN, false);
  }
}
