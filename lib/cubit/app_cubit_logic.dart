import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travox/cubit/app_cubit.dart';
import 'package:travox/cubit/app_cubit_states.dart';
import 'package:travox/screens/detail_screen.dart';
import 'package:travox/screens/main_screen.dart';
import 'package:travox/screens/pages/home_page.dart';
import 'package:travox/screens/welcome_screen.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is WelcomeState) {
            return const WelcomePage();
          }
          if(state is LoadingState) {
            return const Center(child:
              CircularProgressIndicator(),);
          }
          if(state is LoadedState) {
            return const MainPage();
          }
          if(state is DetailState) {
            return const DetailPage();
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}
