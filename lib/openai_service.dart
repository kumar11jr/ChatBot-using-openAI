import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  static const String endpoint = 'https://api.openai.com/v1/chat/completions';

  final String apiKey;


  OpenAIService(this.apiKey);

  Future<String> getResponse(String prompt) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model":"gpt-3.5-turbo",
        "messages": [{"role": "user", "content": prompt}]

      }),

    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to get response from OpenAI');
    }
  }
}