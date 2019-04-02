import 'package:learnswedish/models/flashcard.dart';

class WordList {
	bool hasRomanization;
	List<FlashCard> words;

	WordList({this.hasRomanization, this.words});

	WordList.fromJson(Map<String, dynamic> json) {
		hasRomanization = json['has_romanization'];
		if (json['words'] != null) {
			words = new List<FlashCard>();
			json['words'].forEach((v) { words.add(new FlashCard.fromJson(v)); });
		}
	}
}