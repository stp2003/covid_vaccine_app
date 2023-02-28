import 'package:covid_vaccine_app/screens/home_screen.dart';
import 'package:covid_vaccine_app/screens/vaccine_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Vaccine App Flutter',
      theme: ThemeData.dark().copyWith(),

      //** initial route ->
      initialRoute: 'home',

      //** routes ->
      routes: {
        'home': (context) => const HomeScreen(),
        'vaccine': (context) => const VaccineResultsScreen(),
      },
    );
  }
}
