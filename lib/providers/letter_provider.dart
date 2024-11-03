import 'package:abc_sbpu_project/models/alphabet_entry.dart';
import 'package:abc_sbpu_project/providers/alphabet_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final letterProvider =
    FutureProvider.family<AlphabetEntry, String>((ref, letter) async {
  return ref.watch(alphabetProvider.future).then((letters) {
    return letters.firstWhere((letterEntry) {
      return letterEntry.letter == letter;
    });
  });
});
