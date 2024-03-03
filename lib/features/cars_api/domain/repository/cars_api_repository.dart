import 'package:dartz/dartz.dart';
import 'package:cars_api/core/failure.dart';
import 'package:cars_api/features/cars_api/domain/entity/cars_api_entity.dart';

abstract class CarsRepository {
  Future<Either<Fauiler, List<CarEntity>>> writeCar(
    int limit,
    String model,
  );
}
