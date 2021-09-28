import 'package:flutter/material.dart';

//Consts
import 'package:stock/constants/strings.dart' as Strings;

// Models
import 'package:stock/models/stock.dart';
import 'package:stock/screenArguments/detailsArguments.dart';

class HomeController {
  navigateToDetails(BuildContext context, Stock stock) {
    Navigator.pushNamed(
      context,
      Strings.detailsRoute,
      arguments: DetailsArguments(
        stock,
      ),
    );
  }
}
