import 'package:flutter/material.dart';

// Consts
import 'package:stock/constants/colors.dart' as Colors;
import 'package:stock/constants/dimens.dart' as Dimens;
import 'package:stock/constants/styles.dart' as Styles;

// Models
import 'package:stock/models/stock.dart';

class DetailsStockWidget extends StatelessWidget {
  const DetailsStockWidget({
    Key? key,
    required this.stock,
  }) : super(key: key);

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.detailsStockBackground,
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
    );
  }
}
