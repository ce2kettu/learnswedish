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
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("", style: TextStyle(inherit: true, color: Colors.black)),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    DeckDetailHeader(deck),
                    SizedBox(height: 8.0),
                    Divider(),
                    /* Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DeckDetailBody(deck),
                    ), */
                    SizedBox(height: 8.0),
                  ],
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: DeckDetailBody(deck),
          ),
        ],
      ),
    );
  }
}
