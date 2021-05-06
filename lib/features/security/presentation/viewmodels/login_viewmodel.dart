import 'package:flutter/material.dart';
import 'package:sample_new_structure_app/features/security/domain/entities/user.dart';
import 'package:sample_new_structure_app/features/security/domain/repositories/iauthentication_repository.dart';
import 'package:sample_new_structure_app/router/router_setup.gr.dart';
import 'package:sample_new_structure_app/utilities/viewmodel/base_view_model.dart';

//Extend BaseViewModel to use BaseWidget
class LoginViewModel extends BaseViewModel {
  //repository must be injected
  final IAuthenticationRepository _repository;

  final userNameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  //inject instance of repository
  LoginViewModel(this._repository);

  //can contain UI Logic
  //but must not contain any business logic
  //business logic must only remain in the repository
  void signIn() async {
    final user = User.signIn(
      userNameTextEditingController.text,
      passwordTextEditingController.text,
    );

    final result = await _repository.signIn(user);

    if (result) {
      _signInSuccess();
    } else {
      _signInFailed();
    }
  }

  void _signInSuccess() {
    //Routes is from generated code from AutoRoute Package
    //if this is missing run this command in terminal
    //flutter pub run build_runner build --delete-conflicting-outputs
    //appContext is part of the viewModel which gets a global navigator context declared from main.dart
    Navigator.of(appContext).pushNamed(Routes.homePage);
  }

  void _signInFailed() {}

  @override
  void onDispose() {
    userNameTextEditingController.dispose();
    passwordTextEditingController.dispose();

    //don't forget to call super.onDispose();
    super.onDispose();
  }
}
