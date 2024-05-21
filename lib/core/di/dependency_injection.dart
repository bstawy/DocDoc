import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/register/data/repos/register_repo.dart';
import '../../features/auth/register/logic/register_cubit.dart';
import '../../features/pages/appointment/data/repos/appointments_repo.dart';
import '../../features/pages/appointment/logic/appointments_cubit.dart';
import '../../features/pages/home/data/repos/home_repo.dart';
import '../../features/pages/home/logic/home_cubit.dart';
import '../../features/pages/home/ui/pages/doctors/data/repos/doctors_repo.dart';
import '../../features/pages/home/ui/pages/doctors/logic/doctors_cubit.dart';
import '../../features/pages/home/ui/pages/specialities/data/repos/specialities_repo.dart';
import '../../features/pages/home/ui/pages/specialities/logic/specialities_cubit.dart';
import '../../features/pages/search/logic/search_cubit.dart';
import '../caching/hive_manager.dart';
import '../networking/api_service/api_service.dart';
import '../networking/dio/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio freeDio = DioFactory.getFreeDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(freeDio));

  // Hive
  getIt.registerLazySingleton<HiveManager>(() => HiveManager.getInstance());

  // Login
  getIt.registerFactory<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Register
  getIt.registerFactory<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // Home
  getIt.registerFactory<HomeRepo>(() => HomeRepo(getIt(), getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // Specialities
  getIt.registerFactory<SpecialitiesRepo>(
      () => SpecialitiesRepo(getIt(), getIt()));
  getIt.registerFactory<SpecialitiesCubit>(() => SpecialitiesCubit(getIt()));

  // Doctors
  getIt.registerFactory<DoctorsRepo>(() => DoctorsRepo(getIt(), getIt()));
  getIt.registerFactory<DoctorsCubit>(() => DoctorsCubit(getIt()));

  // Search
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt(), getIt()));

  // Appointments
  getIt.registerFactory<AppointmentsRepo>(
      () => AppointmentsRepo(getIt(), getIt()));
  getIt.registerFactory<AppointmentsCubit>(() => AppointmentsCubit(getIt()));
}
