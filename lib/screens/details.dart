import 'package:flutter/material.dart';
import 'package:stock/models/criteria.dart';

// Arguments
import 'package:stock/screenArguments/detailsArguments.dart';

// Consts
import 'package:stock/constants/colors.dart' as Colors;
import 'package:stock/constants/dimens.dart' as Dimens;
import 'package:stock/constants/strings.dart' as Strings;
import 'package:stock/constants/styles.dart' as Styles;

// Controllers
import 'package:stock/controllers/details.dart';

// Models
import 'package:stock/models/stock.dart';

// Widgets
import 'package:stock/widgets/detailsStock.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);

  final DetailsContoller _contoller = DetailsContoller();

  @override
  Widget build(BuildContext context) {
    final _args =
        ModalRoute.of(context)!.settings.arguments as DetailsArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        title: Text(
          Strings.detailsScreen,
          style: Styles.appBarTitle,
        ),
      ),
      body: buildBody(_args.stock),
    );
  }

  SafeArea buildBody(Stock stock) {
    return SafeArea(
      child: SizedBox.expand(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              DetailsStockWidget(stock: stock),
              Padding(
                padding: Dimens.criteriasPadding,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int i) {
                      return buildCriteriaText(context, stock.criteria[i]);
                    },
                    separatorBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: Dimens.criteriaPadding,
                        child: Text(
                          Strings.and,
                          style: Styles.subTitle,
                        ),
                      );
                    },
                    itemCount: stock.criteria.length),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCriteriaText(BuildContext context, Criteria criteria) {
    String _criteriaText = criteria.text;
    List<TextSpan> _criteriaTextSpans = [];
    if (criteria.type == "variable") {
      _criteriaTextSpans =
          _contoller.processText(context, criteria.variable, _criteriaText);
    } else {
      _criteriaTextSpans.add(
        TextSpan(
          text: _criteriaText,
          style: Styles.title,
        ),
      );
    }

    return Padding(
      padding: Dimens.criteriaPadding,
      child: RichText(
        text: TextSpan(
          children: _criteriaTextSpans,
        ),
      ),
    );
  }
}
