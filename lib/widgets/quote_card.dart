import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/quote_model.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({super.key, required this.quote});

  void _shareQuote(BuildContext context) {
    final text = '"${quote.text}" - ${quote.author}';
    Share.share(text);  // Opens the system's share menu
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '"${quote.text}"',
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "- ${quote.author}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _shareQuote(context),
                  icon: const Icon(Icons.share),
                  label: const Text("Share"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
