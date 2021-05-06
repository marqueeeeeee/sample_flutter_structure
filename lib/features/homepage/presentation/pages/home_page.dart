import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_new_structure_app/dependencies/injector_container.dart';
import 'package:sample_new_structure_app/features/homepage/presentation/viewmodels/home_viewmodel.dart';
import 'package:sample_new_structure_app/utilities/widget/base_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: sl(), //don't forget to declare HomeViewModel in dependency
      builder: (context, model, child) => _HomeView(),
    );
  }
}

//alway make this private so only HomePage is invocable from other class
class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //provider will locate instance of HomeViewModel from the tree
    //base_widget handles the injection of instance to Provider
    //sl or service locator handles the initialization of the viewmodel
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(viewModel.helloWorldText),
      ),
    );
  }
}
