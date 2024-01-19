part of 'app_route_config.dart';

class AppRouteConfig {
  static GoRouter get router => _goRouter;

  static final GoRouter _goRouter = GoRouter(
    routes: [
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
      GoRoute(
        path: AppPage.allProducts.toPath,
        name: AppPage.allProducts.toName,
        pageBuilder: (context, state) => const MaterialPage(child: AllProductsPage()),
      ),
      GoRoute(
        path: AppPage.productDetails.toPath,
        name: AppPage.productDetails.toName,
        pageBuilder: (context, state) => const MaterialPage(child: ProductDetailsPage()),
      ),
      GoRoute(
        path: AppPage.notFound.toPath,
        name: AppPage.notFound.toName,
        pageBuilder: (context, state) => const MaterialPage(child: NotFoundPage()),
      ),
    ],
    errorPageBuilder: (context, state) => const MaterialPage(child: NotFoundPage()),
  );
}
