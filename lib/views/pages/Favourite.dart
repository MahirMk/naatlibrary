import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  @override
  FavouriteState createState() => FavouriteState();
}

class FavouriteState extends State<Favourite> {

  final _randomWordPairs = <WordPair>[];
  final _addWordPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isEven) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadyadd = _addWordPairs.contains(pair);

    // word-pair tile
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
        trailing: Icon(alreadyadd ? Icons.favorite : Icons.favorite,
            color: alreadyadd ? Colors.red : null),
        onTap: () {
          setState(() {
            if (alreadyadd) {
              _addWordPairs.remove(pair);
            } else {
              _addWordPairs.add(pair);
            }
          });
        });
  }

  void _pushadd() => Navigator.of(context)
      .push(
      MaterialPageRoute(
          builder: (BuildContext context) {
            final Iterable<ListTile> tiles = _addWordPairs.map((WordPair pair) {
              return ListTile(
                  title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0))
              );
            }
            );

            final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();

            // saved word-pair page
            return Scaffold(
                appBar: AppBar(title: Text('Favourite')),
                body: ListView(children: divided)
            );
          })
  );

  // home page
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: AppBar(
            title: Text('List'),
            actions: [
              IconButton(
                  onPressed: _pushadd,
                  icon: Icon(Icons.favorite_outline,color: Colors.red)
              ),
            ],
          ),
          body: _buildList()
      );
}