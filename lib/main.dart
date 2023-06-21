import 'package:api/api.dart';
import 'package:completion_repository/completion_repository.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  /// init api package [CompletionApi()]
  final apiClient = CompletionApi();

  /// init package [CompletionRepository] and insert api from [apiClient]
  final completionRepository = CompletionRepository(completionApi: apiClient);

  /// inject [completionRepository] then running the project
  final app = App(completionRepository: completionRepository);

  runApp(app);
}
