import 'dart:io';

import 'package:afghan_food/providers/favorite_cart.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class FavoriteScreen extends ConsumerWidget {
  static const String id = 'favorite';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cartProvider = ref.watch(cartNotifierProvider);
    final favoriteProvider = ref.watch(favoriteNotifierProvider);
    // if (favoriteProvider.isEmpty) {
    //   return Scaffold(
    //     backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
    //     body: Center(
    //       child: Expanded(
    //         child: Text(
    //           'There is no data found, please add data',
    //           style: TextStyle(
    //             color: Theme.of(context).colorScheme.surface,
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // } else {
    if (favoriteProvider.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        ),
        child: Center(
          child: Text(
            'There is no Favorite found, please add new Favorite',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.surface,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        title: const Text('Favorite Screen'),
        actions: [
          IconButton(
            onPressed: () {
              _showConfirmationDialog(context, ref);
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
          ),
          child: Column(
            children: [
              Column(
                children: favoriteProvider.map((favotite) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              favotite.image,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const Gap(20),
                          Text(
                            favotite.title,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "\$${favotite.price}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SingleChildScrollView(
//         child:
//       ),
// Method to show confirmation dialog

void _showConfirmationDialog(BuildContext context, WidgetRef ref) {
  final favoriteItems = ref.watch(favoriteNotifierProvider);
  if (favoriteItems.isEmpty) return;
  if (Platform.isIOS) {
    // Show Cupertino (iOS-style) dialog
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Confirm'),
          content: const Text('Are you sure you want to delete all favorites?'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close the dialog without doing anything
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                ref
                    .read(favoriteNotifierProvider.notifier)
                    .clearFavorites(); // Clear all favorites
                Navigator.of(context).pop(); // Close the dialog
              },
              isDestructiveAction: true,
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  } else {
    // Show Material (Android-style) dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Are you sure you want to delete all favorites?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close the dialog without doing anything
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(favoriteNotifierProvider.notifier)
                    .clearFavorites(); // Clear all favorites
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
