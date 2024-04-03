import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/register/data/repos/register_repo.dart';
import '../../features/auth/register/logic/register_cubit.dart';
import '../networking/api_service/api_service.dart';
import '../networking/dio/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // Register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
}
