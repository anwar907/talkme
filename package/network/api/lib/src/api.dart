import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:http/http.dart' as http;

class FoodApi implements TalkmeApi {
  @override
  Future<CompletionModels> fetchDataCompletion(
      {String? roleValue, String? contentValue}) async {
    try {
      final response = await http.post(
          Uri.parse('https://api.openai.com/v1/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer <token here>',
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": roleValue, "content": contentValue}
            ]
          }));

      return CompletionModels.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Future.error(e);
    }
  }
}
