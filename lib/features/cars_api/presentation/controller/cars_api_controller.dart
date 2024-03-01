import 'package:flutter/material.dart';
import 'package:cars_api/features/cars_api/domain/entity/cars_api_entity.dart';
import 'package:cars_api/features/cars_api/domain/repository/cars_api_repository.dart';

enum CarState {
  initial,
  loading,
  success,
  error,
}

class CarsController extends ChangeNotifier{
  final CarsRepository _repo;
  List<CarEntity> _carsList = [];
  List<CarEntity> get getCarsList => _carsList;

  int get getCount => getCarsList.length;

  CarState state = CarState.initial;

  CarsController(this._repo);

  void init() async {
    search();
  }

  void search([int limit = 10, String model = "camry"]) async {
    state = CarState.loading;

    final result = await _repo.writePr(limit, model);

    result.fold((l) => state = CarState.error, (list) {
      _carsList = list;
      state = CarState.success;
    });
    notifyListeners();
  }
}