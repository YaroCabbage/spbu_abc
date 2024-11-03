import 'dart:math';

import 'package:abc_sbpu_project/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import '../providers/alphabet_provider.dart';

@RoutePage()
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});
  // Calculate optimal grid items per row based on screen width
  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 32.0; // Total horizontal padding
    double maxItemSize = 100.0;
    double minItemSize = 60.0; // Minimum size for grid items

    // Available width for grid items
    double availableWidth = screenWidth - padding;

    // Calculate how many items can fit if we use maxItemSize
    int countAtMaxSize = availableWidth ~/ maxItemSize;

    // Calculate how many items can fit if we use minItemSize
    int countAtMinSize = availableWidth ~/ minItemSize;

    // If we can't fit at least 2 items at max size, use the minimum size count
    return countAtMaxSize < 2 ? countAtMinSize : countAtMaxSize;
  }

  // Calculate item size based on available space and cross axis count
  double _calculateItemSize(BuildContext context, int crossAxisCount) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 32.0; // Total horizontal padding
    double spacing = 16.0 * (crossAxisCount - 1); // Total spacing between items

    // Available width for grid items
    double availableWidth = screenWidth - padding - spacing;

    // Calculate size per item
    double itemSize = availableWidth / crossAxisCount;

    // Return the smaller of calculated size or max size (100)
    return itemSize > 100 ? 100 : itemSize;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alphabetAsync = ref.watch(alphabetProvider);
    final width = MediaQuery.sizeOf(context).longestSide;

    return Scaffold(
      // appBar: AppBar(title: const Text('Alphabet Grid')),
      body: alphabetAsync.when(
        data: (entries) {

          return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: min(width/3, 300), // Maximum width/height of each grid item
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final entry = entries[index];
            return Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 4)),
              child: InkWell(
                onTap: () =>
                    context.router.push(DetailRoute(letter: entry.letter)),
                child: Center(
                  child: Text(
                    entry.letter,
                    style: Theme.of(context).textTheme.headlineMedium,
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
  }
}
