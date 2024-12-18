import 'dart:typed_data';

import 'package:abc_sbpu_project/generated/l10n.dart';
import 'package:abc_sbpu_project/providers/letter_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DetailScreen extends ConsumerWidget {
  final String letter;

  const DetailScreen({super.key, @PathParam() required this.letter});

  @override
  Widget build(BuildContext context, ref) {
    final letterValue = ref.watch(letterProvider(letter));

    final letterData = letterValue.value;
    if (letterData == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.letterDetails(letterData.letter)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (letterData.imageData != null)
              Center(
                child: Image.memory(
                  Uint8List.fromList(letterData.imageData!),
                  height: 200,
                  // width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
            const SizedBox(height: 16),
            Text(l10n.conceptLabel(letterData.concept),
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(l10n.sourceLabel(letterData.source)),
            const SizedBox(height: 16),
            Text(l10n.definitionLabel,
                style: Theme.of(context).textTheme.titleMedium),
            Text(letterData.definition),
            const SizedBox(height: 16),
            Text(l10n.usageLabel,
                style: Theme.of(context).textTheme.titleMedium),
            Text(letterData.usage),
          ],
        ),
      ),
    );
  }
}
