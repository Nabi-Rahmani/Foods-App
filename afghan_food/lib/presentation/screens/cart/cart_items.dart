import 'dart:io';

import 'package:afghan_food/providers/cart_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CartItems extends ConsumerStatefulWidget {
  const CartItems({super.key});

  @override
  ConsumerState<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends ConsumerState<CartItems> {
  @override
  Widget build(BuildContext context) {
    final cartItemProduct = ref.watch(cartNotifierProvider);
    final totalPriceCollect = ref.watch(addCartItemsProvider);
    if (cartItemProduct.isEmpty) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.surface,
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.9),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              'There is no data found please add new data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Theme.of(context).colorScheme.surface,
              ),
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
        title: Text(
          'Add Cart Item',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartItemProduct.map((product) {
                return Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          product.image,
                          height: 60,
                          width: 60,
                        ),
                      ),
                      const Gap(16),
                      Text(
                        product.title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Text(
              '\$ $totalPriceCollect',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, WidgetRef ref) {
    if (Platform.isIOS) {
      // Show Cupertino (iOS-style) dialog
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Confirm'),
            content:
                const Text('Are you sure you want to delete all favorites?'),
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
                      .read(cartNotifierProvider.notifier)
                      .clearCarts(); // Clear all favorites
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
            content:
                const Text('Are you sure you want to delete all favorites?'),
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
                      .read(cartNotifierProvider.notifier)
                      .clearCarts(); // Clear all favorites
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
}
