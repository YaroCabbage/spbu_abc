import 'package:abc_sbpu_project/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true, path: '/'),
        CustomRoute(
          page: DetailRoute.page,
          path: '/:letter',
        ),
      ];
}
