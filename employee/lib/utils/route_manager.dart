import 'package:employee/bindings/home_bindings.dart';
import 'package:employee/bindings/index.dart';
import 'package:employee/screens/home_screen.dart';
import 'package:employee/screens/login_screen.dart';
import 'package:employee/screens/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteManager {
  static List<GetPage> getRoutes = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
      binding: HomeBindings(),
    )
  ];
}
