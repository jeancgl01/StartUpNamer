import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';  // Add this line.

void main() => runApp(MyApp());

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair>_suggestions = <WordPair>[];
  final TextStyle _biggerFont = TextStyle(fontSize:18.0);

  @override
  Widget build(BuildContext context) {
    //final word = new WordPair.random();    
    //return Text(word.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('StartUp name generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int index) {
        if (index.isOdd){
          return Divider();
        }
        final int idx = index ~/2;
        if (idx >= _suggestions.length ){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[idx]);
      },

    );
  }

  Widget _buildRow(WordPair pair){
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
  }


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      title: 'Welcome to Flutter',      
      home: new RandomWords(),
    );
  }
}