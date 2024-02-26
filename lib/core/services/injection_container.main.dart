part of 'injection_container.dart';

final sl = GetIt.instance;

class InjectionContainer {
  static Future<void> init() async {
    await _initAuth();
    await _initHome();
    await _initProductDetails();
    await _initFavorites();
  }

  static Future<void> _initAuth() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    sl.registerFactory(
      () => AuthBloc(
          sendOtp: sl(),
          verifyOtpAndSignIn: sl(),
          registerAccount: sl(),
          signOut: sl(),
          getUserData: sl()),
    );

    sl.registerLazySingleton(
      () => SendOtp(sl()),
    );

    sl.registerLazySingleton(
      () => VerifyOtpAndSignIn(sl()),
    );

    sl.registerLazySingleton(
      () => RegisterAccount(sl()),
    );

    sl.registerLazySingleton(
      () => SignOut(sl()),
    );

    sl.registerLazySingleton(
      () => GetUserData(sl()),
    );

    sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        sl(),
        sl(),
      ),
    );

    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        sl(),
        sl(),
      ),
    );

    sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()),
    );

    sl.registerLazySingleton(() => FirebaseAuth.instance);

    sl.registerLazySingleton(() => FirebaseFirestore.instance);

    sl.registerLazySingleton(() => sharedPreferences);
  }

  static Future<void> _initHome() async {
    sl.registerFactory(
      () => HomeBloc(
        getAllNewProducts: sl(),
        getAllBestSellingProducts: sl(),
        getAllProductsSortedByPrice: sl(),
        getProductsByFilter: sl(),
      ),
    );

    sl.registerLazySingleton(
      () => GetAllNewProducts(sl()),
    );

    sl.registerLazySingleton(
      () => GetAllBestSellingProducts(sl()),
    );

    sl.registerLazySingleton(
      () => GetAllProductsSortedByPrice(sl()),
    );

    sl.registerLazySingleton(
      () => GetProductsByFilter(sl()),
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

  static Future<void> _initFavorites() async {
    sl.registerFactory(
      () => FavoritesBloc(getFavoritesList: sl()),
    );

    sl.registerLazySingleton(
      () => GetFavoritesList(sl()),
    );

    sl.registerLazySingleton<FavoritesRepo>(
      () => FavoritesRepoImpl(sl()),
    );

    sl.registerLazySingleton<FavoritesRemoteDataSource>(
      () => FavoritesRemoteDataSourceImpl(sl(), sl()),
    );
  }
}
