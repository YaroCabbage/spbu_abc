import 'package:abc_sbpu_project/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import '../screens/main_screen.dart';
import '../screens/detail_screen.dart';

// @MaterialAutoRouter(
//   replaceInRouteName: 'Screen,Route',
//   routes: <AutoRoute>[
//     AutoRoute(page: MainScreen, initial: true),
//     AutoRoute(page: DetailScreen),
//   ],
// )

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true, path: '/'),
        CustomRoute(
          page: DetailRoute.page,
          // transitionsBuilder: TransitionsBuilders.zoomIn,
          path: '/:letter',
        ),
      ];
}