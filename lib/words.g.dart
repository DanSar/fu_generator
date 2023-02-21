// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Words _$WordsFromJson(Map<String, dynamic> json) => Words(
      number: json['number'] as String?,
      language: json['language'] as String?,
      insult: json['insult'] as String?,
      created: json['created'] as String?,
      shown: json['shown'] as String?,
      createdby: json['createdby'] as String?,
      active: json['active'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$WordsToJson(Words instance) => <String, dynamic>{
      'number': instance.number,
      'language': instance.language,
      'insult': instance.insult,
      'created': instance.created,
      'shown': instance.shown,
      'createdby': instance.createdby,
      'active': instance.active,
      'comment': instance.comment,
    };
