


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter/HARRY_POTER/cubit/hogwarts_cubit.dart';
import 'package:harry_potter/HARRY_POTER/presentation/screens/search_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HogwartsCubit(),
     
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SearchHome()
      ),
    );
  }
}
