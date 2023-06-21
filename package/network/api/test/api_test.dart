import 'package:api/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test Response', () async {
    var data = await FoodApi().fetchDataCompletion(
        roleValue: 'user', contentValue: 'can you hear me?');

    print(data.choise?[0].message?.content);
  });
}
