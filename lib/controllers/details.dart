import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Consts
import 'package:stock/constants/strings.dart' as Strings;
import 'package:stock/constants/styles.dart' as Styles;
import 'package:stock/screenArguments/optionsArguments.dart';

class DetailsContoller {
  navigateToOptions(BuildContext context, dynamic variable) {
    Navigator.pushNamed(
      context,
      Strings.optionsRoute,
      arguments: OptionsArguments(
        variable: variable,
      ),
    );
  }

  List<TextSpan> processText(
      BuildContext context, dynamic variables, String text) {
    List<TextSpan> _criteriaTextSpans = [];
    Map<String, dynamic> _variables = variables;
    String _criteriaSubString = "";
    for (String char in text.characters) {
      _criteriaSubString += char;
      // Check if start of variable
      if (char == "\$") {
        // Store non-variable string
        String _criteriaTextSpan =
            _criteriaSubString.substring(0, _criteriaSubString.length - 1);
        // Refresh _criteriaSubString to start with $
        _criteriaSubString = "\$";
        // Add TextSpan to _criteriaTextSpans
        _criteriaTextSpans.add(
          TextSpan(
            text: _criteriaTextSpan,
            style: Styles.title,
          ),
        );
      }
      // Check if variable
      else if (_criteriaSubString.contains("\$")) {
        for (String key in _variables.keys) {
          if (key == _criteriaSubString) {
            // Refresh _criteriaSubString
            _criteriaSubString = "";
            // Variable value
            String _variableValue = "";
            // Check variable type
            switch (_variables[key]["type"]) {
              case "indicator":
                _variableValue = _variables[key]["default_value"].toString();
                break;
              case "value":
                _variableValue = _variables[key]["values"][0].toString();
                break;
            }
            // Add TextSpan to _criteriaTextSpans
            _criteriaTextSpans.add(
              TextSpan(
                text: "(" + _variableValue + ")",
                style: Styles.hyperLink,
                recognizer: new TapGestureRecognizer()
                  ..onTap = () => navigateToOptions(
                        context,
                        _variables[key],
                      ),
              ),
            );
          }
        }
      } else if (char == text.characters.last) {
        _criteriaTextSpans.add(
          TextSpan(
            text: _criteriaSubString,
            style: Styles.title,
          ),
        );
      }
    }
    return _criteriaTextSpans;
  }
}
