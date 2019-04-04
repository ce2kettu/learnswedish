import 'package:flutter/material.dart';
import 'package:learnswedish/models/deck.dart';

class DeckDetailBody extends StatelessWidget {
  final Deck deck;

  DeckDetailBody(this.deck);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: new SliverChildBuilderDelegate((context, index) {
        return Column(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              alignment: Alignment.center,
              child: Card(
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.0),
                        topLeft: Radius.circular(4.0),
                      ),
                      child: Image.network(
                        deck.flashCards[index].imageUrl,
                        fit: BoxFit.contain,
                        width: 90.0,
                        height: 90.0,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(deck.flashCards[index].word ?? 'Unknown'),
                        Text(deck.flashCards[index].wordClass ?? 'Unknown'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }, childCount: deck.flashCards.length),
    );
  }
}
