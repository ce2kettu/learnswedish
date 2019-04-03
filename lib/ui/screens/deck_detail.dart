import 'package:flutter/material.dart';
import 'package:learnswedish/models/deck.dart';
import 'package:learnswedish/models/flashcard.dart';

class DeckDetail extends StatefulWidget {
  final Deck deck;

  DeckDetail(this.deck);

  @override
  State<StatefulWidget> createState() {
    return new DeckDetailState();
  }
}

class DeckDetailState extends State<DeckDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(widget.deck.imageUrl),
          SizedBox(height: 24.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.deck.title,
                  style: Theme.of(context).textTheme.headline.copyWith(
                        height: 0.7,
                      ),
                ),
                SizedBox(height: 12.0),
                Text(
                  widget.deck.description,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(child: deckCards()),
        ],
      ),
    );
  }

  Widget deckCards() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.deck.flashCards.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              alignment: Alignment.center,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.0),
                        topLeft: Radius.circular(4.0),
                      ),
                      child: Image.network(
                        widget.deck.flashCards[index].imageUrl,
                        fit: BoxFit.contain,
                        width: 90.0,
                        height: 90.0,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.deck.flashCards[index].word ?? 'Unknown'),
                        Text(widget.deck.flashCards[index].wordClass ??
                            'Unknown'),
                      ],
                    ),
                    Spacer(),
                    ButtonTheme.bar(
                      // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('Open'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}