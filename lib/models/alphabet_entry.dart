import 'package:freezed_annotation/freezed_annotation.dart';

part 'alphabet_entry.g.dart';

part 'alphabet_entry.freezed.dart';

@freezed
class AlphabetEntry with _$AlphabetEntry {
  const factory AlphabetEntry({
    required String letter,
    required String concept,
    required String source,
    required String definition,
    required String usage,
    required List<int>? imageData,
  }) = _AlphabetEntry;

  factory AlphabetEntry.fromJson(Map<String, dynamic> json) =>
      _$AlphabetEntryFromJson(json);
}
