import 'dart:convert';

import 'package:flutter/foundation.dart';

class SignInResponseModel {
  final bool isLoggedIn;

  SignInResponseModel({@required this.isLoggedIn});

  Map<String, dynamic> toMap() {
    return {
      'isLoggedIn': isLoggedIn,
    };
  }

  factory SignInResponseModel.fromMap(Map<String, dynamic> map) {
    return SignInResponseModel(
      isLoggedIn: map['isLoggedIn'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInResponseModel.fromJson(String source) =>
      SignInResponseModel.fromMap(json.decode(source));
}
