import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cars_api/features/cars_api/presentation/controller/cars_api_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
          'Не выполнено ${context.watch<CarsController>().getCount}'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
