part of 'injection_container.dart';

final sl = GetIt.instance;

class InjectionContainer {
  static Future<void> init() async {
    await _initAuth();
    await _initHome();
    await _initProductDetails();
  }

  static Future<void> _initAuth() async {
    sl.registerFactory(
      () =>
          AuthBloc(sendOtp: sl(), verifyOtp: sl(), registerAccount: sl(), signOut: sl()),
    );

    sl.registerLazySingleton(
      () => SendOtp(sl()),
    );

    sl.registerLazySingleton(
      () => VerifyOtp(sl()),
    );

    sl.registerLazySingleton(
      () => RegisterAccount(sl()),
    );

    sl.registerLazySingleton(
      () => SignOut(sl()),
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

  static Future<void> _initHome() async {
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

  static Future<void> _initProductDetails() async {
    sl.registerFactory(
      () => ProductDetailsBloc(
        getProductDetails: sl(),
        addToCart: sl(),
        addToFavorites: sl(),
      ),
    );

    sl.registerLazySingleton(
      () => GetProductDetails(sl()),
    );

    sl.registerLazySingleton(
      () => AddToCart(sl()),
    );

    sl.registerLazySingleton(
      () => AddToFavorites(sl()),
    );

    sl.registerLazySingleton<ProductDetailsRepo>(
      () => ProductDetailsRepoImpl(sl()),
    );

    sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
      () => ProductDetailsRemoteDataSourceImpl(sl()),
    );
  }
}
