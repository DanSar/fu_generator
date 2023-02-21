import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'words.g.dart';

@JsonSerializable()
class Words {
  String? number;
  String? language;
  String? insult;
  String? created;
  String? shown;
  String? createdby;
  String? active;
  String? comment;

  Words(
      {this.number,
      this.language,
      this.insult,
      this.created,
      this.shown,
      this.createdby,
      this.active,
      this.comment});

  factory Words.fromJson(Map<String, dynamic> json) => _$WordsFromJson(json);

  Map<String, dynamic> toJson() => _$WordsToJson(this);
  // number = json['number'];
  // language = json['language'];
  // insult = json['insult'];
  // created = json['created'];
  // shown = json['shown'];
  // createdby = json['createdby'];
  // active = json['active'];
  // comment = json['comment'];

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['number'] = this.number;
  //   data['language'] = this.language;
  //   data['insult'] = this.insult;
  //   data['created'] = this.created;
  //   data['shown'] = this.shown;
  //   data['createdby'] = this.createdby;
  //   data['active'] = this.active;
  //   data['comment'] = this.comment;
  //   return data;
  // }
}

Future<Words> getWords() async {
  const url = 'https://evilinsult.com/generate_insult.php?lang=ru&type=json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Words.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
