part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initAuth();
  await _initHome();
}

Future<void> _initAuth() async {
  sl.registerFactory(
    () => AuthBloc(signIn: sl(), signUpWithEmail: sl()),
  );

  sl.registerLazySingleton(
    () => SignIn(sl()),
  );

  sl.registerLazySingleton(
    () => SignUpWithEmail(sl()),
  );

  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(sl()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl(), sl()),
  );

  sl.registerLazySingleton(() => FirebaseAuth.instance);

  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}

Future<void> _initHome() async {
  sl.registerFactory(
    () => HomeBloc(getAllProducts: sl()),
  );

  sl.registerLazySingleton(
    () => GetAllProducts(sl()),
  );

  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(sl()),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl()),
  );
}
