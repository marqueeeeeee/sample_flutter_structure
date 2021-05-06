import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_new_structure_app/features/security/presentation/pages/login_page.dart';
import 'package:sample_new_structure_app/router/router_setup.gr.dart';
import 'dependencies/injector_container.dart' as di;

final globalAppNavigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  //intialize service locator
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),

      //auto router setup
      builder: ExtendedNavigator.builder<ARouter>(
        router: ARouter(),
        navigatorKey: globalAppNavigatorKey,
      ),
    );
  }
}
