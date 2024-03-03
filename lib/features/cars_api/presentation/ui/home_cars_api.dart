import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cars_api/features/cars_api/presentation/controller/cars_api_controller.dart';
import 'package:cars_api/features/cars_api/presentation/widget/cars_api_card.dart';

class HomeCars extends StatelessWidget {
  HomeCars({super.key});

  final TextEditingController model_ = TextEditingController(text: "camry");
  final TextEditingController searchCount_ = TextEditingController(text: "10");

  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _keyForm,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Поле пустое';
                        }
                        return null;
                      },
                      controller: model_,
                      decoration: const InputDecoration(
                        label: Text('Модель'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Поле пустое';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: searchCount_,
                      decoration: const InputDecoration(
                        label: Text('Количество'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<CarsController>()
                          .search(int.parse(searchCount_.text), model_.text);
                    },
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
