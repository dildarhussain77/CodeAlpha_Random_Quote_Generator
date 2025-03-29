import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class QuoteRepository {
  static const String apiUrl = "https://favqs.com/api/qotd";

  static Future<Quote> getRandomQuote() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Quote.fromJson(data);
      } else {
        throw Exception("Failed to load quote");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
