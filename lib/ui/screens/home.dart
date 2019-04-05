import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnswedish/models/deck.dart';
import 'package:learnswedish/models/flashcard.dart';
import 'package:learnswedish/models/wordlist.dart';
import 'package:learnswedish/ui/screens/deck_detail.dart';

List<FlashCard> flashCards = [];

Future<String> loadData() async {
  return await rootBundle.loadString('assets/wordlist.json');
}

Future<List<Deck>> loadDecks() async {
  String jsonString = await loadData();
  final jsonResponse = json.decode(jsonString);
  WordList wordList = new WordList.fromJson(jsonResponse);
  List<Deck> decks = [
    new Deck(
      id: 1,
      title: 'Core Vocabulary',
      description: 'This deck will help you refresh your knowledge of the core words in the Swedish language.',
      imageUrl: 'https://d9np3dj86nsu2.cloudfront.net/image/112cb693d1d69eca438e6e23b9c59080',
      flashCards: wordList.words,
    )
  ];

  return decks;
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title:
            Text("Home", style: TextStyle(inherit: true, color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Text(
                "Your decks",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            FutureBuilder<List<Deck>>(
              future: loadDecks(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? availableDecks(snapshot.data)
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget availableDecks(List<Deck> decks) {
    return Container(
      height: 205.0,
      child: ListView.builder(
        itemCount: decks.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Card(
              child: InkWell(
                radius: 95.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: Hero(
                          tag: decks[i].id,
                          child: Image.network(
                            decks[i].imageUrl ??
                                'https://via.placeholder.com/350x150',
                            height: 120.0,
                            width: 200.0,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 200.0,
                      child: Padding(
                        // padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                        padding: EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              decks[i].title,
                              style: TextStyle(fontSize: 18.0),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              decks[i].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "Words: " +
                                  (decks[i].flashCards.length + 1).toString(),
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (context) {
                    return new DeckDetail(decks[i]);
                  }));
                },
              ),
            ),
      ),
    );
  }
}
