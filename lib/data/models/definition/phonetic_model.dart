class Phonetic {
  String text;
  String audio;
  String sourceUrl;

  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) {
    return Phonetic(
      text: json['text'],
      audio: json['audio'],
      sourceUrl: json['sourceUrl'],);
  }
}