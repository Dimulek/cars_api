class CarsModel {
  final int year;
  final String model;
  final String make;

  CarsModel({
    required this.year,
    required this.model,
    required this.make,
  });

  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
      make: json['make'],
      model: json['model'],
      year: json['year'],
    );
  }

  /**
   * "city_mpg": 18,
    "class": "midsize car",
    "combination_mpg": 21,
    "cylinders": 4,
    "displacement": 2.2,
    "drive": "fwd",
    "fuel_type": "gas",
    "highway_mpg": 26,
    "make": "toyota",
    "model": "camry",
    "transmission": "a",
    "year": 1993
   */
}
