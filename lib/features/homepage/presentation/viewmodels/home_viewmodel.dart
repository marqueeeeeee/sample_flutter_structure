import 'package:sample_new_structure_app/utilities/viewmodel/base_view_model.dart';

//Extend BaseViewModel to use BaseWidget
class HomeViewModel extends BaseViewModel {
  static const HELLO_WORLD = "HELLO WORLD";

  String get helloWorldText => HELLO_WORLD;
}
