import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_new_structure_app/constants/base_api_constants.dart';
import 'package:sample_new_structure_app/data/datasources/authentication_datasource.dart';
import 'package:sample_new_structure_app/data/repositories/authentication_repository_impl.dart';
import 'package:sample_new_structure_app/domain/repositories/iauthentication_repository.dart';
import 'package:sample_new_structure_app/features/homepage/presentation/viewmodels/home_viewmodel.dart';
import 'package:sample_new_structure_app/features/security/presentation/viewmodels/login_viewmodel.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //DATASOURCES
  sl.registerLazySingleton<IAuthenticationRemoteDatasource>(
      () => AuthenticationDatasourceImpl(sl()));

  //REPOSITORIES
  sl.registerLazySingleton<IAuthenticationRepository>(
      () => AuthenticationRespositoryImpl(sl()));

  //ViewModels
  sl.registerFactory(() => LoginViewModel(sl()));
  sl.registerFactory(() => HomeViewModel());

  //External
  final dioBaseOptions = BaseOptions(baseUrl: BaseApiConstants.BASE_URL);
  final dio = Dio(dioBaseOptions);
  sl.registerLazySingleton<Dio>(() => dio);
}
