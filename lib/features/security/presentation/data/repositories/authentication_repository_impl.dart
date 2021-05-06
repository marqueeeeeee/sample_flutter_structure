import 'package:sample_new_structure_app/features/security/presentation/data/datasources/authentication_datasource.dart';
import 'package:sample_new_structure_app/features/security/presentation/data/models/sign_in_request_model.dart';
import 'package:sample_new_structure_app/features/security/presentation/domain/entities/user.dart';
import 'package:sample_new_structure_app/features/security/presentation/domain/repositories/iauthentication_repository.dart';

class AuthenticationRespositoryImpl implements IAuthenticationRepository {
  final IAuthenticationRemoteDatasource _authenticationremoteDatasource;

  AuthenticationRespositoryImpl(this._authenticationremoteDatasource);

  @override
  Future<bool> signIn(User user) async {
    final requestModel =
        SignInRequestModel(username: user.username, password: user.password);
    final response =
        await _authenticationremoteDatasource.signInApiRequest(requestModel);

    return response.isLoggedIn;
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
