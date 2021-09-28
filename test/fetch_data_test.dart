import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock/models/stock.dart';
import 'package:stock/repository/repository.dart';

import 'fetch_data_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetchData', () {
    String data = 'https://mobile-app-challenge.herokuapp.com/data';
    test('Return data if successful', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(
        client.get(
          Uri.parse(data),
        ),
      ).thenAnswer(
        (_) async => http.Response(
            '[{"id":1,"name":"Mock","tag":"Tag","color":"green","criteria":[{"type":"plain_text","text":"Lorem Ispum"}]}]',
            200),
      );

      expect(await fetchData(client), isA<List<Stock>>());
    });

    test('Throw exception if error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(
        client.get(
          Uri.parse(data),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );

      expect(fetchData(client), throwsException);
    });
  });
}
