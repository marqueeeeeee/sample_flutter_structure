import 'dart:convert';

import 'package:flutter/foundation.dart';

class SignInRequestModel {
  final String username;
  final String password;

  SignInRequestModel({
    @required this.username,
    @required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory SignInRequestModel.fromMap(Map<String, dynamic> map) {
    return SignInRequestModel(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInRequestModel.fromJson(String source) =>
      SignInRequestModel.fromMap(json.decode(source));
}
