import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable //this class and their subclasses will never be changed upon initializaton
class AuthUser {
  final String id;
  final String? email;
  final bool isEmailVerified;
  const AuthUser({
    required this.id,
    required this.email,
    required this.isEmailVerified,
  }); //constructor

  factory AuthUser.fromFirebase(User user) => AuthUser(
        id: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified,
      );
  //In above code, we made a copy of the firebase user and pasted it into our own user (auth user) to use that, and so that ui code isn't directly accessing the firebase and an abstraction layer is maintained
}
