import 'dart:math';

import 'package:abc_sbpu_project/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/alphabet_provider.dart';

@RoutePage()
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alphabetAsync = ref.watch(alphabetProvider);
    final width = MediaQuery.sizeOf(context).longestSide;

    final body = Scaffold(
      appBar:  AppBar(title: const Text('Азбука курса "Антропология детства"'),),
      body: alphabetAsync.when(
        data: (entries) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: min(width / 3, 300),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                ),
                child: InkWell(
                  onTap: () =>
                      context.router.push(DetailRoute(letter: entry.letter)),
                  child: Center(
                    child: Text(
                      entry.letter,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 70),
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );

    return Theme(data: _buildTheme(), child: body);
  }
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData(
    primarySwatch: Colors.grey,
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.kablammoTextTheme(baseTheme.textTheme),
  );
}
