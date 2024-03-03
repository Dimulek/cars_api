import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:cars_api/di/service.dart';
import 'package:cars_api/features/cars_api/presentation/controller/cars_api_controller.dart';
import 'package:cars_api/features/cars_api/presentation/ui/home_cars_api.dart';
import 'package:cars_api/routes/router_utils.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Pages.home.screenPath,
        name: Pages.home.screenName,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => service<CarsController>()..init(),
          child: HomeCars(),
        ),
      ),
    ],
  );
}
