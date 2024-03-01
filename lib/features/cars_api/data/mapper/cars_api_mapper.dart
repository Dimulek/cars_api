import 'package:cars_api/features/cars_api/data/model/cars_api_model.dart';
import 'package:cars_api/features/cars_api/domain/entity/cars_api_entity.dart';

extension CarMapperModel on CarModel {
  CarEntity toEntity() {
    return CarEntity(
      year: year,
      model: model,
      make: make,
    );
  }
}
