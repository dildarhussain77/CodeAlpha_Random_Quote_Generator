import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Random Quote Generator", style : TextStyle(color: Colors.white))),               
          backgroundColor: Colors.blueAccent,      
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Adjust curve radius
            ),
          ),
          
        ),
        body: Center(
          child: quoteProvider.currentQuote == null
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuoteCard(quote: quoteProvider.currentQuote!),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => quoteProvider.fetchNewQuote(),
                      icon: const Icon(Icons.refresh),
                      label: const Text("New Quote"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
