class AfghanFoodProducts {
  final String id;
  final String title;
  final int price;
  final String image;
  bool? isVisible;
  AfghanFoodProducts(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      this.isVisible});
  // AfghanFoodProducts copyWith({
  //   String? id,
  //   String? title,
  //   int? price,
  //   String? image,
  //   bool? isVisible,
  // }) {
  //   return AfghanFoodProducts(
  //     id: id ?? this.id,
  //     title: title ?? this.title,
  //     price: price ?? this.price,
  //     image: image ?? this.image,
  //     isVisible: isVisible ?? this.isVisible,
  //   );
  // }
}
