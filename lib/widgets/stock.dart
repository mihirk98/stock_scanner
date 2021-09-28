import 'package:flutter/material.dart';

// Consts
import 'package:stock/constants/colors.dart' as Colors;
import 'package:stock/constants/dimens.dart' as Dimens;
import 'package:stock/constants/styles.dart' as Styles;

// Controllers
import 'package:stock/controllers/home.dart';

// Models
import 'package:stock/models/stock.dart';

class StockWidget extends StatelessWidget {
  const StockWidget({
    Key? key,
    required this.controller,
    required this.stock,
  }) : super(key: key);

  final HomeController controller;
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.navigateToDetails(context, stock),
      child: Container(
        padding: Dimens.stockPadding,
        child: ListTile(
          title: Text(
            stock.name,
            style: Styles.title,
          ),
          subtitle: Text(
            stock.tag,
            style: Styles.subTitle.apply(
              color: stock.color == "green" ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
