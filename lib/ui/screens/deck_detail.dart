import 'package:flutter/material.dart';
import 'package:learnswedish/models/deck.dart';
import 'package:learnswedish/ui/common/deck_detail_body.dart';
import 'package:learnswedish/ui/common/deck_detail_header.dart';

class DeckDetail extends StatelessWidget {
  final Deck deck;

  DeckDetail(this.deck);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 247, 240, 1.0),
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          DeckDetailHeader(deck),
          DeckDetailBody(deck),
        ],
      ),
    );
  }
}
