part of 'app_route_config.dart';

class AppRouteConfig {
  final BuildContext context;
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  AppRouteConfig(this.context);

  GoRouter get router => _goRouter;

  static final GoRouter _goRouter = GoRouter(
    initialLocation: AppPage.home.toPath,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ShellPage(child: child);
        },
        routes: [
          GoRoute(
            path: AppPage.home.toPath,
            name: AppPage.home.toName,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => const MaterialPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: AppPage.favorites.toPath,
            name: AppPage.favorites.toName,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => const MaterialPage(
              child: FavoritesPage(),
            ),
          ),
          GoRoute(
            path: AppPage.profile.toPath,
            name: AppPage.profile.toName,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => const MaterialPage(
              child: ProfilePage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppPage.auth.toPath,
        name: AppPage.auth.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: AuthPage(),
        ),
      ),
      GoRoute(
        path: AppPage.verifyOtp.toPath,
        name: AppPage.verifyOtp.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final args = state.extra as Map<String, String>;
          return MaterialPage(
            child: VerifyOtpPage(
              phoneNumber: args["phoneNumber"]!,
            ),
          );
        },
      ),
      GoRoute(
        path: AppPage.registerAccount.toPath,
        name: AppPage.registerAccount.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final args = state.extra as Map<String, String>;
          return MaterialPage(
            child: RegisterAccountPage(
              phoneNumber: args["phoneNumber"]!,
            ),
          );
        },
      ),
      GoRoute(
        path: AppPage.allProducts.toPath,
        name: AppPage.allProducts.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: AllProductsPage(),
        ),
      ),
      GoRoute(
        path: "${AppPage.productDetails.toPath}/:productId",
        name: AppPage.productDetails.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ProductDetailsPage(
              productId: state.pathParameters["productId"]!,
            ),
          );
        },
      ),
      GoRoute(
        path: AppPage.search.toPath,
        name: AppPage.search.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: SearchPage(),
        ),
      ),
      GoRoute(
        path: AppPage.cart.toPath,
        name: AppPage.cart.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: CartPage(),
        ),
      ),
      GoRoute(
        path: AppPage.chat.toPath,
        name: AppPage.chat.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: ChatPage(),
        ),
      ),
      GoRoute(
        path: AppPage.accountAndSecurity.toPath,
        name: AppPage.accountAndSecurity.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: AccountAndSecurityPage(),
        ),
      ),
      GoRoute(
        path: AppPage.addresses.toPath,
        name: AppPage.addresses.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: AddressesPage(),
        ),
      ),
      GoRoute(
        path: AppPage.notFound.toPath,
        name: AppPage.notFound.toName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: NotFoundPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => const MaterialPage(
      child: NotFoundPage(),
    ),
  );
}
