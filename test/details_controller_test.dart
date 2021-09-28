import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Controller
import 'package:stock/controllers/details.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  test('Process text for hyperlinks returns TextSpan', () {
    DetailsContoller _contoller = DetailsContoller();
    MockBuildContext _mockContext = MockBuildContext();
    String text = "Mock text \$1 is complete";
    Map<String, dynamic> _variables = {
      "\$1": {
        "type": "value",
        "values": [-3, -1, -2, -5, -10]
      }
    };

    expect(_contoller.processText(_mockContext, _variables, text),
        isA<List<TextSpan>>());
  });
}
