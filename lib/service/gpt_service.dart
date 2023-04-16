import 'dart:convert';

import 'package:feed_me/config/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GPTService {
  Future askGPT(String prompt) async {
    try {
      final res = await http.post(Uri.parse("kGPTUrl"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $kChatGtpKey'
          },
          body: jsonEncode({
            'model': 'gpt-3.5-turbo',
            'message': [
              {
                'role': 'user',
                'content': prompt,
              }
            ]
          }));
      return jsonDecode(res.body);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
