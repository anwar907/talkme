import 'package:api_client/models/completion_models.dart';

abstract class TalkmeApi {
  Future<CompletionModels> fetchDataCompletion(
      {String? roleValue, String? contentValue});
}
