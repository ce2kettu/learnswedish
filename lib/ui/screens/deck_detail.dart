import 'package:flutter/material.dart';
import 'package:learnswedish/models/deck.dart';
import 'package:learnswedish/models/flashcard.dart';

class DeckDetail extends StatefulWidget {
  Deck deck;
  
  DeckDetail(this.deck);

  @override
  State<StatefulWidget> createState() {
    return new _stateDeckDetail();
  }
}

class _stateDeckDetail extends State<DeckDetail> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Text(widget.deck.flashCards[0].english),
    );
  }
}