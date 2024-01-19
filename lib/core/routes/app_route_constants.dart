enum AppPage {
  signIn,
  signUp,
  home,
  cart,
  chat,
  search,
  allProducts,
  productDetails,
  settings,
  notFound
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.home:
        return "/";
      case AppPage.signIn:
        return "/sign_in";
      case AppPage.signUp:
        return "/sign_up";
      case AppPage.cart:
        return "/cart";
      case AppPage.chat:
        return "/chat";
      case AppPage.search:
        return "/search";
      case AppPage.allProducts:
        return "/all_products";
      case AppPage.productDetails:
        return "/product_details";
      case AppPage.settings:
        return "/settings";
      case AppPage.notFound:
        return "/not_found";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.home:
        return "HOME";
      case AppPage.signIn:
        return "SIGN_IN";
      case AppPage.signUp:
        return "SIGN_UP";
      case AppPage.cart:
        return "CART";
      case AppPage.chat:
        return "CHAT";
      case AppPage.search:
        return "SEARCH";
      case AppPage.allProducts:
        return "ALL_PRODUCTS";
      case AppPage.productDetails:
        return "PRODUCT_DETAILS";
      case AppPage.settings:
        return "SETTINGS";
      case AppPage.notFound:
        return "NOT_FOUND";
      default:
        return "HOME";
    }
  }
}
