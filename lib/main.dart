import 'package:cars_api/model/cars_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

enum Pages { first, second }

class testChange with ChangeNotifier {
  Pages i = Pages.first;

  void changeFir() async {
    i = Pages.first;
    notifyListeners();
  }

  void changeSec() async {
    i = Pages.second;
    notifyListeners();
  }
}

final service = GetIt.instance;

Future<void> init() async {
  // StateManagment
  service.registerSingleton<testChange>(testChange());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ChangeNotifierProvider.value(
          value: service<testChange>(),
          builder: (context, child) => Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  if (service.get<testChange>().i == Pages.first) {
                    context.read<testChange>().changeSec();
                  } else {
                    context.read<testChange>().changeFir();
                  }
                },
                child: Text("Press"),
              ),
              switch (context.select<testChange, Pages>((value) => value.i)) {
                Pages.first => const Text("First"),
                Pages.second => const Text("Second"),
              },
            ],
          ),
        ),
      ),
    );
  }
}
