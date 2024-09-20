// ignore_for_file: unrelated_type_equality_checks

import 'package:afghan_food/models/afghan_food_products.dart';
import 'package:afghan_food/providers/providers_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider_visibale.g.dart';

@riverpod
class VisibilityProvider extends _$VisibilityProvider {
  @override
  List<AfghanFoodProducts> build() {
    return allprudcts;
  }

  void toggleVisibility(String id) {
    state = state.map((product) {
      if (product.id == id) {
        return AfghanFoodProducts(
          id: product.id,
          title: product.title,
          price: product.price,
          image: product.image,
          isVisible: product.isVisible, // Toggle visibility
        );
      }
      return product;
    }).toList();
  }
}
