import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travox/screens/main_screen.dart';
import 'package:travox/screens/welcome_screen.dart';
import 'package:travox/services/data_services.dart';

import 'cubit/app_cubit.dart';
import 'cubit/app_cubit_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travox02',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.purple,
      ),
      home: BlocProvider(create: (context) => AppCubits(data: DataServices()),
      child: const AppCubitLogic()),
    );
  }
}

