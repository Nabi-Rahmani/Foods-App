// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$afghanFoodProductProviderHash() =>
    r'ab025294ea3ad54c37ca360a1ad1e510c46eb771';

/// See also [afghanFoodProductProvider].
@ProviderFor(afghanFoodProductProvider)
final afghanFoodProductProviderProvider =
    AutoDisposeProvider<List<AfghanFoodProducts>>.internal(
  afghanFoodProductProvider,
  name: r'afghanFoodProductProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$afghanFoodProductProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AfghanFoodProductProviderRef
    = AutoDisposeProviderRef<List<AfghanFoodProducts>>;
String _$reduceafghanFoodProductProviderHash() =>
    r'c104a1bd70182bdfd90b5dd5c4e3e5dc8c0e02ac';

/// See also [reduceafghanFoodProductProvider].
@ProviderFor(reduceafghanFoodProductProvider)
final reduceafghanFoodProductProviderProvider =
    AutoDisposeProvider<List<AfghanFoodProducts>>.internal(
  reduceafghanFoodProductProvider,
  name: r'reduceafghanFoodProductProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reduceafghanFoodProductProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReduceafghanFoodProductProviderRef
    = AutoDisposeProviderRef<List<AfghanFoodProducts>>;
String _$filteredProductsProviderHash() =>
    r'01e790501ac76ab3092c66cbbb6d6cda1b010f7a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [filteredProductsProvider].
@ProviderFor(filteredProductsProvider)
const filteredProductsProviderProvider = FilteredProductsProviderFamily();

/// See also [filteredProductsProvider].
class FilteredProductsProviderFamily extends Family<List<AfghanFoodProducts>> {
  /// See also [filteredProductsProvider].
  const FilteredProductsProviderFamily();

  /// See also [filteredProductsProvider].
  FilteredProductsProviderProvider call(
    Category category,
  ) {
    return FilteredProductsProviderProvider(
      category,
    );
  }

  @override
  FilteredProductsProviderProvider getProviderOverride(
    covariant FilteredProductsProviderProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredProductsProviderProvider';
}

/// See also [filteredProductsProvider].
class FilteredProductsProviderProvider
    extends AutoDisposeProvider<List<AfghanFoodProducts>> {
  /// See also [filteredProductsProvider].
  FilteredProductsProviderProvider(
    Category category,
  ) : this._internal(
          (ref) => filteredProductsProvider(
            ref as FilteredProductsProviderRef,
            category,
          ),
          from: filteredProductsProviderProvider,
          name: r'filteredProductsProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredProductsProviderHash,
          dependencies: FilteredProductsProviderFamily._dependencies,
          allTransitiveDependencies:
              FilteredProductsProviderFamily._allTransitiveDependencies,
          category: category,
        );

  FilteredProductsProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final Category category;

  @override
  Override overrideWith(
    List<AfghanFoodProducts> Function(FilteredProductsProviderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredProductsProviderProvider._internal(
        (ref) => create(ref as FilteredProductsProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<AfghanFoodProducts>> createElement() {
    return _FilteredProductsProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredProductsProviderProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilteredProductsProviderRef
    on AutoDisposeProviderRef<List<AfghanFoodProducts>> {
  /// The parameter `category` of this provider.
  Category get category;
}

class _FilteredProductsProviderProviderElement
    extends AutoDisposeProviderElement<List<AfghanFoodProducts>>
    with FilteredProductsProviderRef {
  _FilteredProductsProviderProviderElement(super.provider);

  @override
  Category get category =>
      (origin as FilteredProductsProviderProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
