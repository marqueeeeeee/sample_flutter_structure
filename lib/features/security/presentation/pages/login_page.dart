import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_new_structure_app/dependencies/injector_container.dart';
import 'package:sample_new_structure_app/features/security/presentation/viewmodels/login_viewmodel.dart';
import 'package:sample_new_structure_app/utilities/widget/base_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: sl(), //don't forget to declare HomeViewModel in dependency
      builder: (context, model, child) => _LoginView(),
    );
  }
}

//Login Page or View must only contain View related Code
//login_page.dart must also contain Login Page related classes or views
//must not contain any UI Logic, ui logic must be done in the viewmodel
//alway make this private so only HomePage is invocable from other class
class _LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //provider will locate instance of HomeViewModel from the tree
    //base_widget handles the injection of instance to Provider
    //sl or service locator handles the initialization of the viewmodel
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: viewModel.userNameTextEditingController,
              decoration: InputDecoration(hintText: "Username"),
            ),
            TextFormField(
              controller: viewModel.passwordTextEditingController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            RaisedButton(
              onPressed: viewModel.signIn,
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
