class FlashCard {
  String img;
  String get imageUrl => this.img != null
      ? 'https://d1pra95f92lrn3.cloudfront.net/media/thumb/${this.img}_96square.jpg'
      : 'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_960_720.jpg';
  String audio;
  String wordClass;
  String english;
  String flashcardId;
  String meaning;
  String id;
  String gender;
  String word;
  String enAudio;
  List<Phrases> phrases;
  List<Sentences> sentences;
  List<Examples> examples;

  
  FlashCard(
      {this.img,
      this.audio,
      this.wordClass,
      this.english,
      this.flashcardId,
      this.meaning,
      this.id,
      this.gender,
      this.word,
      this.enAudio,
      this.phrases,
      this.sentences,
      this.examples});

  FlashCard.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    audio = json['audio'];
    wordClass = json['class'];
    english = json['english'];
    flashcardId = json['flashcardId'];
    meaning = json['meaning'];
    id = json['id'];
    gender = json['Gender'];
    word = json['word'];
    enAudio = json['en_audio'];
    if (json['phrases'] != null) {
      phrases = new List<Phrases>();
      json['phrases'].forEach((v) {
        phrases.add(new Phrases.fromJson(v));
      });
    }
    if (json['sentences'] != null) {
      sentences = new List<Sentences>();
      json['sentences'].forEach((v) {
        sentences.add(new Sentences.fromJson(v));
      });
    }
    if (json['examples'] != null) {
      examples = new List<Examples>();
      json['examples'].forEach((v) {
        examples.add(new Examples.fromJson(v));
      });
    }
  }
}

class Phrases {
  String audio;
  String text;
  String english;
  String enAudio;

  Phrases({this.audio, this.text, this.english, this.enAudio});

  Phrases.fromJson(Map<String, dynamic> json) {
    audio = json['audio'];
    text = json['text'];
    english = json['english'];
    enAudio = json['en_audio'];
  }
}

class Sentences {
  String audio;
  String text;
  String english;
  String enAudio;

  Sentences({this.audio, this.text, this.english, this.enAudio});

  Sentences.fromJson(Map<String, dynamic> json) {
    audio = json['audio'];
    text = json['text'];
    english = json['english'];
    enAudio = json['en_audio'];
  }
}

class Examples {
  String audio;
  String text;
  String english;
  String enAudio;

  Examples({this.audio, this.text, this.english, this.enAudio});

  Examples.fromJson(Map<String, dynamic> json) {
    audio = json['audio'];
    text = json['text'];
    english = json['english'];
    enAudio = json['en_audio'];
  }
}
