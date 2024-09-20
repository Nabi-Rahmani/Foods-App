import 'package:afghan_food/models/afghan_food_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends Notifier<Set<AfghanFoodProducts>> {
  @override
  Set<AfghanFoodProducts> build() {
    return {
      // AfghanFoodProducts(
      //   id: '4',
      //   title: 'Manto',
      //   price: 30,
      //   image: 'assets/images/manto.webp',
      // ),
    };
  }

  void addFavorite(AfghanFoodProducts product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void remmoveFavorite(AfghanFoodProducts product) {
    state = state.difference({product});
    state = {...state};
  }

  void clearFavorites() {
    state = {}; // Clear the set of favorites
  }
}

final favoriteNotifierProvider =
    NotifierProvider<FavoriteNotifier, Set<AfghanFoodProducts>>(() {
  return FavoriteNotifier();
});
