import 'package:flutter/material.dart';
import 'package:learnswedish/models/deck.dart';

class DeckDetailBody extends StatelessWidget {
  final Deck deck;

  DeckDetailBody(this.deck);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 330.0,
            padding: EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16.0),
                    itemCount: deck.flashCards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Card(
                          child: InkWell(
                            child: Container(
                              width: 300,
                              height: 350,
                              child: Padding(
                                padding: EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(deck.flashCards[index].word ?? 'null'),
                                    SizedBox(height: 8.0),
                                    Text(deck.flashCards[index].wordClass ??
                                        'null'),
                                    SizedBox(height: 8.0),
                                    Text(deck.flashCards[index].meaning ??
                                        'null'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 95, 105, 1.0),
                        Color.fromRGBO(255, 95, 105, 1.0),
                        Color.fromRGBO(255, 95, 105, 1.0),
                        Color.fromRGBO(252, 126, 134, 1.0),
                        Color.fromRGBO(252, 126, 134, 1.0)
                      ],
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 24.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    textColor: Colors.white,
                    child: Text(
                      "Start lesson",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
