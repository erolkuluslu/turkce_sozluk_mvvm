import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:turkce_sozluk_mvvm/models/words_response.dart';

import '../models/words_response.dart';

class DictionaryService {
  Future<List<String>> searchWord(String word) async {
    Uri url = Uri.parse('https://sozluk.gov.tr/gts?ara=$word');
    final response = await http.get(url);
    if (response == 200) {
      final result = json.decode(response.body);
      List<String> meanings = [];
      if (result[0] != null) {
        WordsResponse wordsResponse = WordsResponse.fromJson(result[0]);
        for (MeaningList meaning in wordsResponse.meaningList!) {
          meanings.add(meaning.meaning!);
        }
      }
      return meanings;
    }

    throw Exception("Bad Request");
  }
}
