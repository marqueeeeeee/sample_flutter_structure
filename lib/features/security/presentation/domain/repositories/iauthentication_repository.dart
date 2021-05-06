import 'package:sample_new_structure_app/features/security/presentation/domain/entities/user.dart';

abstract class IAuthenticationRepository {
  Future<bool> signIn(User user);

  Future<bool> signOut();
}
