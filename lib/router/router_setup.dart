import 'package:auto_route/auto_route_annotations.dart';
import 'package:sample_new_structure_app/features/homepage/presentation/pages/home_page.dart';
import 'package:sample_new_structure_app/features/security/presentation/pages/login_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: LoginPage, initial: true),
    MaterialRoute(page: HomePage),
  ],
)
class $ARouter {}
