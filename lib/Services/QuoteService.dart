import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:livelife/Models/Quote.dart';


class QuoteService {
  static const String url = 'https://zenquotes.io/api/random';

  Future<Quote> fetchRandomQuote() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Quote.fromJson(json[0]);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
