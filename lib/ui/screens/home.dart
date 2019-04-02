import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnswedish/models/deck.dart';
import 'package:learnswedish/models/flashcard.dart';
import 'package:learnswedish/models/wordlist.dart';
import 'package:learnswedish/ui/screens/deck_detail.dart';

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
            availableDecks()
          ])),
    );
  }

  List<Deck> decks = [
    new Deck(
        id: 1,
        title: 'Core Vocabulary',
        description: '10 000 most commonly used words in Swedish',
        imageUrl: 'http://flags.fmcdn.net/data/flags/w580/se.png',
        flashCards: [
          new FlashCard(english: 'Test'),
          new FlashCard(english: 'Test2'),
          new FlashCard(english: 'Test3')
        ]),
    new Deck(
        id: 1,
        title: 'Core Vocabulary',
        description: '10 000 most commonly used words in Swedish',
        imageUrl: 'http://flags.fmcdn.net/data/flags/w580/se.png',
        flashCards: [
          new FlashCard(english: 'Test'),
          new FlashCard(english: 'Test2'),
          new FlashCard(english: 'Test3')
        ]),
    new Deck(
        id: 1,
        title: 'Core Vocabulary',
        description: '10 000 most commonly used words in Swedish',
        imageUrl: 'http://flags.fmcdn.net/data/flags/w580/se.png',
        flashCards: [
          new FlashCard(english: 'Test'),
          new FlashCard(english: 'Test2'),
          new FlashCard(english: 'Test3')
        ]),
    new Deck(
        id: 1,
        title: 'Core Vocabulary',
        description: '10 000 most commonly used words in Swedish',
        imageUrl: 'http://flags.fmcdn.net/data/flags/w580/se.png',
        flashCards: [
          new FlashCard(english: 'Test'),
          new FlashCard(english: 'Test2'),
          new FlashCard(english: 'Test3')
        ])
  ];

  Widget availableDecks() {
    return new Container(
      height: 200.0,
      child: new ListView.builder(
        itemCount: decks.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => new Card(
              child: new InkResponse(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: new Hero(
                          tag: decks[i].id,
                          child: new Image.network(
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
                              style: new TextStyle(fontSize: 18.0),
                              maxLines: 1,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              decks[i].description,
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            )
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
