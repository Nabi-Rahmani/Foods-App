import 'package:afghan_food/presentation/shared/cart_icons.dart';
import 'package:afghan_food/presentation/widgets/my_drawer.dart';
import 'package:afghan_food/providers/cart_items.dart';
import 'package:afghan_food/providers/favorite_cart.dart';
import 'package:afghan_food/providers/providers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HomeScreen extends ConsumerWidget {
  static const String id = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productProviders = ref.watch(afghanFoodProductProviderProvider);
    final cartItemProviders = ref.watch(cartNotifierProvider);
    final favoriteProviders = ref.watch(favoriteNotifierProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.surface,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        title: Text(
          'Afghan Food',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        actions: const [CartIcons()],
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: productProviders.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        if (favoriteProviders.contains(productProviders[index]))
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(favoriteNotifierProvider.notifier)
                                  .remmoveFavorite(productProviders[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  content: const Text('Removed from Favorite'),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Theme.of(context)
                                  .colorScheme
                                  .error
                                  .withOpacity(1.0),
                            ),
                          ),
                        if (!favoriteProviders
                            .contains(productProviders[index]))
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                ref
                                    .read(favoriteNotifierProvider.notifier)
                                    .addFavorite(productProviders[index]);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    content: const Text('Added to Favorite'),
                                    duration: const Duration(
                                      seconds: 3,
                                    ),
                                    action: SnackBarAction(
                                        disabledTextColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        //
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        //
                                        disabledBackgroundColor:
                                            Theme.of(context).colorScheme.error,
                                        //
                                        label: 'Undo',
                                        onPressed: () {
                                          ref
                                              .read(favoriteNotifierProvider
                                                  .notifier)
                                              .remmoveFavorite(
                                                  productProviders[index]);
                                        }),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.favorite_border,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.asset(
                      productProviders[index].image,
                      height: 60,
                      width: 80,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    productProviders[index].title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    productProviders[index].price.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (cartItemProviders.contains(productProviders[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeItems(productProviders[index]);
                        },
                        child: Text(
                          'Remove',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        )),
                  if (!cartItemProviders.contains(productProviders[index]))
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addProduct(productProviders[index]);
                          },
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          )),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
