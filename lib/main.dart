import 'package:flutter/material.dart';
import 'quote.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: 'Oscar Wilde',
        text:
            'Integer posuere erat a ante venenatis dapibus posuere velit aliquet.'),
    Quote(
        author: 'James Vich',
        text:
            'Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.'),
    Quote(
        author: 'Mia Belathos',
        text:
            'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes
            .map((quote) => Text('${quote.text} - ${quote.author}'))
            .toList(),
      ),
    );
  }
}
