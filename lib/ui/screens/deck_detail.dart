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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.black),
            brightness: Brightness.light,
            backgroundColor: Color.fromRGBO(255, 247, 240, 1.0),
            actions: <Widget>[
              Icon(Icons.launch, color: Colors.black),
              SizedBox(width: 16.0),
              Icon(Icons.star, color: Color.fromRGBO(253, 188, 91, 1.0)),
              SizedBox(width: 16.0),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    DeckDetailHeader(deck),
                  ],
                ),
              ],
            ),
          ),
          /* SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: DeckDetailBody(deck),
          ), */
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(24.0),
                  height: 350.0,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                'https://lacek.hs.llnwd.net/e1/starwood/memberfavorites/0.0.7/370d42a5/images/titlecard_cat6.jpg',
                                height: 350.0,
                                fit: BoxFit.fill,
                              ),
                              Container(
                                //color: Color.fromRGBO(121, 120, 244, 1.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Center(
                                        child: Text(
                                          'What are common early signs and symptoms of autism?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /* Container(
                  color: Colors.brown,
                  height: 75.0,
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
