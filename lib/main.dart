import 'package:api/api.dart';
import 'package:completion_repository/completion_repository.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  final apiClient = CompletionApi();

  final completionRepository = CompletionRepository(completionApi: apiClient);

  final app = App(completionRepository: completionRepository);
  runApp(app);
}
