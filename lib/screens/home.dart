import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// Consts
import 'package:stock/constants/colors.dart' as Colors;

//  Controllers
import 'package:stock/controllers/home.dart';

// Models
import 'package:stock/models/stock.dart';

// Repository
import 'package:stock/repository/repository.dart' as Repository;

// Widgets
import 'package:stock/widgets/stock.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      child: SizedBox.expand(
        child: Container(
          color: Colors.black,
          child: FutureBuilder<List<Stock>>(
              future: Repository.fetchData(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Snapshot data will never be null
                  List<Stock> stocks = snapshot.data!;
                  return ListView.separated(
                    itemBuilder: (BuildContext context, int i) {
                      return StockWidget(
                        controller: _controller,
                        stock: stocks[i],
                      );
                    },
                    separatorBuilder: (BuildContext context, int i) {
                      return DottedLine(
                        dashColor: Colors.white,
                      );
                    },
                    itemCount: stocks.length,
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
              }),
        ),
      ),
    );
  }
}
