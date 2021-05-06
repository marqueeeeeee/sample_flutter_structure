import 'package:dio/dio.dart';
import 'package:sample_new_structure_app/features/security/presentation/data/models/sign_in_request_model.dart';
import 'package:sample_new_structure_app/features/security/presentation/data/models/sign_in_response_model.dart';

abstract class IAuthenticationRemoteDatasource {
  Future<SignInResponseModel> signInApiRequest(SignInRequestModel requestModel);
}

class AuthenticationDatasourceImpl implements IAuthenticationRemoteDatasource {
  final Dio _dio;

  //inject instance of http client
  AuthenticationDatasourceImpl(this._dio);

  @override
  Future<SignInResponseModel> signInApiRequest(
      SignInRequestModel requestModel) async {
    //bypass for test purpose
    return SignInResponseModel(isLoggedIn: true);

    //sample API Request
    // try {
    //   final jsonModel = requestModel.toJson();

    //   final response = await _dio.post(
    //     SecurityApiConstants.SIGN_IN,
    //     data: jsonModel,
    //   );

    //   final model = SignInResponseModel.fromMap(response.data);
    //   return model;
    // } catch (e) {
    //   throw e;
    // }
  }
}
