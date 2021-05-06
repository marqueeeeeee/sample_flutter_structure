import 'package:flutter/material.dart';
import 'package:sample_new_structure_app/main.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isBusy = false;
  bool _isDisposed = false;

  BuildContext get appContext => globalAppNavigatorKey.currentState.context;

  busy() {
    isBusy = true;
  }

  idle() {
    isBusy = false;
  }

  void onLoad() {}

  void onViewDidLoad() {}

  void onDispose() {
    _isDisposed = true;
  }

  void onChangeDependencies() {}

  void onReload() {}

  void onResume() {}

  void onDeactivate() {}

  void onInactive() {}

  void onPaused() {}

  void onDetached() {}

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }
}
