import 'package:api/api.dart';
import 'package:api_client/models/completion_models.dart';
import 'package:completion_repository/completion_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCompletionRepository extends Mock implements CompletionApi {}

class FakeCompletion extends Fake implements CompletionModels {}

void main() {
  group('Completion Repository', () {
    final apiClient = MockCompletionRepository();
    final repository = CompletionRepository(completionApi: apiClient);

    test('Return Exception', () async {
      when(() => apiClient.fetchDataCompletion(
          roleValue: 'rule',
          contentValue: 'value')).thenThrow(Exception('oops'));
      expect(
          () async =>
              repository.fetchDataCompletion(role: 'rule', value: 'value'),
          throwsA(isA<CompletionException>()));
    });

    test('Return Data', () async {
      when(() => apiClient.fetchDataCompletion(
          roleValue: 'rule',
          contentValue: 'value')).thenAnswer((_) async => CompletionModels());
      expect(await repository.fetchDataCompletion(role: 'rule', value: 'value'),
          isA<CompletionModels>());
    });
  });
}
