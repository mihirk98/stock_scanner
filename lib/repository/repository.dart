import 'dart:convert';

import 'package:http/http.dart' as http;

//Models
import 'package:stock/models/stock.dart';

String data = 'https://mobile-app-challenge.herokuapp.com/data';

Future<List<Stock>> fetchData(http.Client client) async {
  final response = await client.get(Uri.parse(data));

  if (response.statusCode == 200) {
    List<dynamic> stocksJSON = jsonDecode(response.body);
    List<Stock> stocks = [];
    stocksJSON.forEach((stock) {
      stocks.add(Stock.fromJson(stock));
    });
    return stocks;
  } else {
    throw Exception('Failed to load data');
  }
}
