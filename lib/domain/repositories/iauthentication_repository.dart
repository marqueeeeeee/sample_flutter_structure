import 'package:sample_new_structure_app/domain/entities/user.dart';

abstract class IAuthenticationRepository {
  Future<bool> signIn(User user);

  Future<bool> signOut();
}
