import 'package:flutter/material.dart';
import 'package:learnswedish/models/deck.dart';

class DeckDetailHeader extends StatelessWidget {
  final Deck deck;
  DeckDetailHeader(this.deck);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(255, 247, 240, 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          children: <Widget>[
                            Hero(
                              tag: deck.id,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Image.network(
                                  deck.imageUrl,
                                  fit: BoxFit.cover,
                                  width: 100.0,
                                  height: 120.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    deck.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  SizedBox(height: 12.0),
                                  Text(
                                    deck.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.body1.copyWith(
                                      color: Colors.black45,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://duolingo-images.s3.amazonaws.com/avatars/206746863/MINMJPvjB_/medium'),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Jonathon',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(255, 95, 105, 1.0),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(width: 18.0),
                            //Spacer(),
                            Icon(
                              Icons.library_books,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              '${deck.flashCards.length} cards',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Divider(height: 0.0),
      ],
    );
  }
}
