import 'package:afghan_food/models/afghan_food_products.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_items.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<AfghanFoodProducts> build() {
    return {
      // AfghanFoodProducts(
      //   id: '4',
      //   title: 'Manto',
      //   price: 30,
      //   image: 'assets/images/manto.webp',
      // ),
      // AfghanFoodProducts(
      //   id: '7',
      //   title: 'Shorba',
      //   price: 120,
      //   image: 'assets/images/shorba.jpg',
      // ),
    };
  }

  // add to cart
  void addProduct(AfghanFoodProducts product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeItems(AfghanFoodProducts product) {
    state = state.difference({product});
    state = {...state};
  }

  void clearCarts() {
    state = {}; // Clear the set of favorites
  }
}

@riverpod
int AddCartItems(ref) {
  final cardProducts = ref.watch(cartNotifierProvider);
  int totalItems = 0;
  for (AfghanFoodProducts product in cardProducts) {
    totalItems += product.price;
  }
  return totalItems;
}


// final cartNotifierProvider =
//     NotifierProvider<CartNotifier, Set<AfghanFoodProducts>>(() {
//   return CartNotifier();
// });
