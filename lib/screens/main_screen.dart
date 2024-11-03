import 'package:abc_sbpu_project/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import '../providers/alphabet_provider.dart';

@RoutePage()
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alphabetAsync = ref.watch(alphabetProvider);

    return Scaffold(
      // appBar: AppBar(title: const Text('Alphabet Grid')),
      body: alphabetAsync.when(
        data: (entries) => GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
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
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
