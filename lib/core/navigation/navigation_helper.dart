part of 'navigation.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  static Future<dynamic> navigateTo(String routeName,
      {Map<String, dynamic>? arguments, bool clean = false}) {
    if (!clean) {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    } else {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  /// Access the arguments from the map
  /// final description = (settings.arguments as Map<String, dynamic>)['description'];

  /// Uncomment the following lines if you want to pass arguments to the LoginView
  /// return MaterialPageRoute(
  ///   builder: (_) => LoginView(
  ///     description: description as String,
  ///   ),
  /// );
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.LOGIN:
        return MaterialPageRoute(builder: (context) => LoginView());
      case AppRoute.REGISTER:
        return MaterialPageRoute(builder: (context) => RegisterView());
      case AppRoute.HOME:
        return MaterialPageRoute(builder: (context) => HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const App());
    }
  }
}
