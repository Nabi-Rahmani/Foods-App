import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  static const String id = 'filter';

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.surface,
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
          title: const Text('Settings'),
        ),
        body: const Center());
  }
}
