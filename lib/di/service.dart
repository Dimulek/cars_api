import 'package:cars_api/core/interceptor_app.dart';
import 'package:cars_api/features/cars_api/presentation/controller/cars_api_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cars_api/features/cars_api/domain/repository/cars_api_repository.dart';
import 'package:cars_api/features/cars_api/data/repository/cars_api_repository_impl.dart';

final service = GetIt.instance;

Future<void> init() async {
  service.registerLazySingleton(() => CarsController(service()));
  service.registerLazySingleton<CarsRepository>(
    () => CarsRepositoryImpl(
    ),
  );
  service.registerLazySingleton(() => Dio(
        BaseOptions(
          // headers: {"X-Api-Key": "Ihn3F2x44nf/EbWui5SOFA==YebHR8EAtQWefVF2"},
          baseUrl: 'https://api.api-ninjas.com/v1/',
        ),
      )..interceptors.addAll(
          [
            InterceptorsApp(),
            PrettyDioLogger(),
          ],
        ));
}
