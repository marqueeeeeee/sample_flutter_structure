import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_new_structure_app/utilities/viewmodel/base_view_model.dart';

class BaseWidget<G extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, G model, Widget child) builder;
  final G model;
  final Widget child;

  BaseWidget({Key key, this.builder, this.model, this.child}) : super(key: key);

  @override
  _BaseWidgetState<G> createState() => _BaseWidgetState<G>();
}

class _BaseWidgetState<G extends BaseViewModel> extends State<BaseWidget<G>>
    with WidgetsBindingObserver {
  G viewModel;

  ///**
  /// Lifecycle Sheet
  ///
  /// 1 on load
  /// 2 on change dependencies
  /// <home>
  /// 3 on inactive
  /// 4 on paused
  /// <re-open app>
  /// 5 on inactive
  /// 6 on resume
  /// <back>
  /// 7 on deactivate
  /// 8 on dispose
  ///
  /// */

  @override
  void initState() {
    viewModel = widget.model;
    viewModel.onLoad();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => viewModel.onViewDidLoad(),
    );
    super.initState();
  }

  @override
  void dispose() {
    viewModel.onDispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        viewModel.onResume();
        break;
      case AppLifecycleState.inactive:
        viewModel.onInactive();
        break;
      case AppLifecycleState.paused:
        viewModel.onPaused();
        break;
      case AppLifecycleState.detached:
        viewModel.onDetached();
        break;
    }
  }

  @override
  void didChangeDependencies() {
    viewModel.onChangeDependencies();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(BaseWidget<G> oldWidget) {
    viewModel.onReload();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    viewModel.onDeactivate();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<G>(
      create: (context) => viewModel,
      child: Consumer<G>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
