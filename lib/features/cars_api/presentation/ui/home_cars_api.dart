import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cars_api/features/cars_api/presentation/controller/cars_api_controller.dart';
import 'package:cars_api/features/cars_api/presentation/widget/cars_api_card.dart';
import 'package:cars_api/features/cars_api/presentation/widget/custom_app_bar.dart';

class HomeCars extends StatelessWidget {
  const HomeCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: switch (
          context.select<CarsController, CarState>((value) => value.state)) {
        CarState.initial || CarState.loading => const Center(
            child: CircularProgressIndicator(),
          ),
        CarState.success => ListView.builder(
            itemCount: context.select<CarsController, int>(
              (value) => value.getCarsList.length,
            ),
            itemBuilder: (context, index) {
              context.read<CarsController>().getCarsList[index];
              return CarCard(
                index: index,
              );
            }),
        CarState.error => const Center(
            child: Text('Ошибка'),
          ),
      },
    );
  }
}
