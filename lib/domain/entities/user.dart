import 'package:flutter/foundation.dart';

class User {
  final String password;
  final String username;
  bool isLoggedIn;

  User({
    @required this.isLoggedIn,
    @required this.password,
    @required this.username,
  });

  User.signIn(this.username, this.password);
}
