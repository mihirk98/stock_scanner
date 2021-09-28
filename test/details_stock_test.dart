import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Consts
import 'package:stock/constants/strings.dart' as Strings;

// Models
import 'package:stock/models/stock.dart';
import 'package:stock/models/criteria.dart';

// Widgets
import 'package:stock/widgets/detailsStock.dart';

void main() {
  testWidgets('DetailsStock has a single Stock argument',
      (WidgetTester tester) async {
    // Create DetailsStockWidget
    await tester.pumpWidget(
      MaterialApp(
        title: Strings.appName,
        home: Scaffold(
          body: Center(
            child: DetailsStockWidget(
              stock: Stock(
                id: 1,
                name: "Mock",
                tag: "Tag",
                color: "green",
                criteria: <Criteria>[],
              ),
            ),
          ),
        ),
      ),
    );

    // Creating the finders
    final nameFinder = find.text('Mock');
    final tagFinder = find.text('Tag');

    expect(nameFinder, findsOneWidget);
    expect(tagFinder, findsOneWidget);
  });
}
