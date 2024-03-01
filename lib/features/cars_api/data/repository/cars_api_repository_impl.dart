import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:cars_api/core/failure.dart';
import 'package:cars_api/di/service.dart';
import 'package:cars_api/features/cars_api/domain/entity/cars_api_entity.dart';
import 'package:cars_api/features/cars_api/domain/repository/cars_api_repository.dart';

import 'package:cars_api/features/cars_api/data/mapper/cars_api_mapper.dart';
import '../model/cars_api_model.dart';

class CarsRepositoryImpl implements CarsRepository {
  @override
  Future<Either<Fauiler, List<CarEntity>>> writePr(
    int limit,
    String model,
  ) async {
    try {
      final data =
          await service<Dio>().get('cars?limit=${limit}&model=${model}');

      return right((data.data as List)
          .map((json) => CarModel.fromJson(json).toEntity())
          .toList());
    } on DioException catch (_) {
      return left(DioException_());
    }
  }
}
