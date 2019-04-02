import './flashcard.dart';

class Deck {
  int id;
  String title;
  String description;
  String imageUrl;
  List<FlashCard> flashCards;

  Deck({this.id, this.title, this.description, this.imageUrl, this.flashCards});

  Deck.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];

    if (json['flashCards'] != null) {
      flashCards = new List<FlashCard>();
      json['flashCards'].forEach((v) {
        flashCards.add(new FlashCard.fromJson(v));
      });
    }
  }
}