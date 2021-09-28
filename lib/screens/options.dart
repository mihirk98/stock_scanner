import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

// Arguments
import 'package:stock/screenArguments/optionsArguments.dart';

// Consts
import 'package:stock/constants/colors.dart' as Colors;
import 'package:stock/constants/dimens.dart' as Dimens;
import 'package:stock/constants/strings.dart' as Strings;
import 'package:stock/constants/styles.dart' as Styles;

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _args =
        ModalRoute.of(context)!.settings.arguments as OptionsArguments;
    final _variable = _args.variable;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        title: Text(
          _variable['study_type'] != null
              ? _variable['study_type'].toString().toUpperCase()
              : Strings.optionsScreen,
          style: Styles.appBarTitle,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          color: Colors.black,
          child: buildBody(_variable),
        ),
      ),
    );
  }

  Container buildBody(dynamic variable) {
    String _variableType = variable["type"];
    switch (_variableType) {
      case "indicator":
        return buildIndicator(variable['default_value'].toString());
      default:
        return buildValue(variable['values']);
    }
  }

  Container buildIndicator(String value) {
    return Container(
      padding: Dimens.indicatorPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.setParameters,
            style: Styles.title,
          ),
          Container(
            color: Colors.white,
            padding: Dimens.periodPadding,
            margin: Dimens.periodMargin,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    Strings.period,
                    style: Styles.title.apply(
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(
                      text: value,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 4.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 4.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildValue(dynamic values) {
    return Container(
      padding: Dimens.valuesPadding,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: Dimens.valuePadding,
            child: Text(
              values[i].toString(),
              style: Styles.title,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int i) {
          return DottedLine(
            dashColor: Colors.white,
          );
        },
        itemCount: values.length,
      ),
    );
  }
}
