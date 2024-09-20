import 'package:afghan_food/models/afghan_food_products.dart';
import 'package:afghan_food/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'providers_list.g.dart';

List<AfghanFoodProducts> allprudcts = [
  AfghanFoodProducts(
    id: '1',
    title: 'Kabab',
    price: 120,
    image: 'assets/images/kabab.jpg',
  ),
  AfghanFoodProducts(
    id: '2',
    title: 'Ashak',
    price: 100,
    image: 'assets/images/ashak.jpg',
  ),
  AfghanFoodProducts(
    id: '3',
    title: 'Bolani',
    price: 10,
    image: 'assets/images/bolani.jpg',
  ),
  AfghanFoodProducts(
    id: '4',
    title: 'Manto',
    price: 30,
    image: 'assets/images/manto.webp',
  ),
  AfghanFoodProducts(
    id: '5',
    title: 'Palaw',
    price: 160,
    image: 'assets/images/palaw.jpg',
  ),
  AfghanFoodProducts(
    id: '6',
    title: 'Sambosa',
    price: 120,
    image: 'assets/images/sambosa.jpg',
  ),
  AfghanFoodProducts(
    id: '7',
    title: 'Shorba',
    price: 120,
    image: 'assets/images/shorba.jpg',
  ),
];

// final afghanFoodProductProvider = Provider((ref) {
//   return allprudcts;
// });
// final reduceafghanFoodProductProvider = Provider((ref) {
//   return allprudcts.where((prices) => prices.price < 40);
// });
@riverpod
List<AfghanFoodProducts> afghanFoodProductProvider(ref) {
  return allprudcts;
}

@riverpod
List<AfghanFoodProducts> reduceafghanFoodProductProvider(ref) {
  return allprudcts.where((prices) => prices.price < 40).toList();
}

@riverpod
List<AfghanFoodProducts> filteredProductsProvider(ref, Category category) {
  final products = ref.watch(afghanFoodProductProviderProvider);
  return products
      .where((product) => product.category == category && product.isVisible)
      .toList();
}
