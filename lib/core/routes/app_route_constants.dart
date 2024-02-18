enum AppPage {
  auth,
  registerAccount,
  verifyOtp,
  home,
  cart,
  chat,
  search,
  allProducts,
  productDetails,
  favorites,
  profile,
  accountAndSecurity,
  addresses,
  notFound
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.home:
        return "/";
      case AppPage.auth:
        return "/auth";
      case AppPage.registerAccount:
        return "/register_account";
      case AppPage.verifyOtp:
        return "/verify_otp";
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
      case AppPage.favorites:
        return "/favorites";
      case AppPage.profile:
        return "/profile";
      case AppPage.accountAndSecurity:
        return "/account_and_security";
      case AppPage.addresses:
        return "/addresses";
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
      case AppPage.auth:
        return "AUTH";
      case AppPage.registerAccount:
        return "REGISTER_ACCOUNT";
      case AppPage.verifyOtp:
        return "VERIFY_OTP";
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
      case AppPage.favorites:
        return "FAVORITES";
      case AppPage.profile:
        return "PROFILE";
      case AppPage.accountAndSecurity:
        return "ACCOUNT_AND_SECURITY";
      case AppPage.addresses:
        return "ADDRESSES";
      case AppPage.notFound:
        return "NOT_FOUND";
      default:
        return "HOME";
    }
  }
}
