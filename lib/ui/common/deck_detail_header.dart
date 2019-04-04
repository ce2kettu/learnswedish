import 'package:flutter/material.dart';
import 'package:learnswedish/models/deck.dart';

class DeckDetailHeader extends StatelessWidget {
  final Deck deck;
  DeckDetailHeader(this.deck);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            deck.title,
            style: textTheme.title,
          ),
          SizedBox(height: 16.0),
          Container(
            height: 120.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          deck.description,
                          maxLines: 2,
                          style: textTheme.body1.copyWith(
                            color: Colors.black45,
                            fontSize: 16.0,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://duolingo-images.s3.amazonaws.com/avatars/206746863/MINMJPvjB_/medium'),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Mam\'s basement',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Icon(Icons.bookmark_border),
                            Text(
                              '133',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
