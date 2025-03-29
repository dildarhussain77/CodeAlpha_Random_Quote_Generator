import 'package:flutter/material.dart';
import '../data/quote_repository.dart';
import '../models/quote_model.dart';

class QuoteProvider extends ChangeNotifier {
  Quote? _currentQuote;

  Quote? get currentQuote => _currentQuote;

  QuoteProvider() {
    fetchNewQuote();
  }

  Future<void> fetchNewQuote() async {
    _currentQuote = await QuoteRepository.getRandomQuote();
    notifyListeners();
  }
}
