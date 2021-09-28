import 'package:stock/models/criteria.dart';

class Stock {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<Criteria> criteria;

  Stock({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    List<dynamic> _criteriaListJSON = json['criteria'];
    List<Criteria> _criteriaList = [];
    _criteriaListJSON.forEach((criteria) {
      _criteriaList.add(Criteria.fromJson(criteria));
    });
    return Stock(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: json['color'],
      criteria: _criteriaList,
    );
  }
}
