import 'package:api/api.dart';
import 'package:api_client/models/completion_models.dart';

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [RepositoryException].
/// {@endtemplate}
class RepositoryException implements Exception {
  /// {@macro RepositoryException}
  RepositoryException(this.error, this.stackTrace);

  /// The [Exception] which was thrown.
  final Exception error;

  /// The full [StackTrace].
  final StackTrace stackTrace;
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [CompletionException].
/// {@endtemplate}
class CompletionException extends RepositoryException {
  /// {@macro RepositoryException}
  CompletionException(super.error, super.stackTrace);
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [ResultAnswerException].
/// {@endtemplate}
class ResultAnswerException extends RepositoryException {
  /// {@macro RepositoryException}
  ResultAnswerException(super.error, super.stackTrace);
}

class CompletionRepository implements Exception {
  CompletionRepository({required CompletionApi completionApi})
      : _completionApi = completionApi;
  final CompletionApi _completionApi;

  Future<CompletionModels> fetchDataCompletion(
      {String? role, String? value}) async {
    try {
      return await _completionApi.fetchDataCompletion(
          roleValue: role, contentValue: value);
    } on Exception catch (error, stackTrace) {
      throw CompletionException(error, stackTrace);
    }
  }
}
