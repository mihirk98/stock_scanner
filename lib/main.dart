import 'package:flutter/material.dart';

// Consts
import 'package:stock/constants/colors.dart' as Colors;
import 'package:stock/constants/strings.dart' as Strings;

// Screens
import 'package:stock/screens/home.dart';
import 'package:stock/screens/details.dart';
import 'package:stock/screens/options.dart';

void main() {
  runApp(StockApp());
}

class StockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: Strings.homeRoute,
      routes: {
        Strings.homeRoute: (context) => HomeScreen(),
        Strings.detailsRoute: (context) => DetailsScreen(),
        Strings.optionsRoute: (context) => OptionsScreen(),
      },
    );
  }
}
