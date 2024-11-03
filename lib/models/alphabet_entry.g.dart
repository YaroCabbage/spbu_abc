// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alphabet_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlphabetEntryImpl _$$AlphabetEntryImplFromJson(Map<String, dynamic> json) =>
    _$AlphabetEntryImpl(
      letter: json['letter'] as String,
      concept: json['concept'] as String,
      source: json['source'] as String,
      definition: json['definition'] as String,
      usage: json['usage'] as String,
      imageData: (json['imageData'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$AlphabetEntryImplToJson(_$AlphabetEntryImpl instance) =>
    <String, dynamic>{
      'letter': instance.letter,
      'concept': instance.concept,
      'source': instance.source,
      'definition': instance.definition,
      'usage': instance.usage,
      'imageData': instance.imageData,
    };
