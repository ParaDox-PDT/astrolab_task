import 'package:flutter_defualt_project/data/models/definition/meaning_model.dart';

import 'phonetic_model.dart';

class InfoModel{
  String word;
  String phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
  List<String> sourceUrls;

  InfoModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.sourceUrls,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      word: json['word'],
      phonetic: json['phonetic'],
      phonetics: List<Phonetic>.from(json['phonetics'].map((x) => Phonetic.fromJson(x))),
      meanings: List<Meaning>.from(json['meanings'].map((x) => Meaning.fromJson(x))),
      sourceUrls: List<String>.from(json['sourceUrls']),
    );
  }

  static List<InfoModel> getFromList(List? list) {
    return list?.map((e) => InfoModel.fromJson(e)).toList() ?? [];
  }
}