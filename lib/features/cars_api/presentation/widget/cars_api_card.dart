import 'package:cars_api/features/cars_api/presentation/controller/cars_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarCard extends StatelessWidget {
  CarCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Row(
          children: <Widget>[
            Text("Модель: " + context.read<CarsController>().getCarsList[index].model + "(${context.read<CarsController>().getCarsList[index].year} года)" + "  index = ${index}")
          ],
        ),
        children: [
          const Text("Производитель"),
          Text(context.read<CarsController>().getCarsList[index].make),
        ],
      ),
    );
  }
}