// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isCap, bool isTShirt, String? title,
            int? priceFrom, int? priceTo)
        loadProducts,
    required TResult Function() loadRecommendedProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isCap, bool isTShirt, String? title, int? priceFrom,
            int? priceTo)?
        loadProducts,
    TResult? Function()? loadRecommendedProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isCap, bool isTShirt, String? title, int? priceFrom,
            int? priceTo)?
        loadProducts,
    TResult Function()? loadRecommendedProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadRecommendedProducts value)
        loadRecommendedProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadRecommendedProducts value)? loadRecommendedProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadRecommendedProducts value)? loadRecommendedProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsEventCopyWith<$Res> {
  factory $ProductsEventCopyWith(
          ProductsEvent value, $Res Function(ProductsEvent) then) =
      _$ProductsEventCopyWithImpl<$Res, ProductsEvent>;
}

/// @nodoc
class _$ProductsEventCopyWithImpl<$Res, $Val extends ProductsEvent>
    implements $ProductsEventCopyWith<$Res> {
  _$ProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadProductsImplCopyWith<$Res> {
  factory _$$LoadProductsImplCopyWith(
          _$LoadProductsImpl value, $Res Function(_$LoadProductsImpl) then) =
      __$$LoadProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isCap, bool isTShirt, String? title, int? priceFrom, int? priceTo});
}

/// @nodoc
class __$$LoadProductsImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$LoadProductsImpl>
    implements _$$LoadProductsImplCopyWith<$Res> {
  __$$LoadProductsImplCopyWithImpl(
      _$LoadProductsImpl _value, $Res Function(_$LoadProductsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCap = null,
    Object? isTShirt = null,
    Object? title = freezed,
    Object? priceFrom = freezed,
    Object? priceTo = freezed,
  }) {
    return _then(_$LoadProductsImpl(
      isCap: null == isCap
          ? _value.isCap
          : isCap // ignore: cast_nullable_to_non_nullable
              as bool,
      isTShirt: null == isTShirt
          ? _value.isTShirt
          : isTShirt // ignore: cast_nullable_to_non_nullable
              as bool,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      priceFrom: freezed == priceFrom
          ? _value.priceFrom
          : priceFrom // ignore: cast_nullable_to_non_nullable
              as int?,
      priceTo: freezed == priceTo
          ? _value.priceTo
          : priceTo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$LoadProductsImpl implements LoadProducts {
  const _$LoadProductsImpl(
      {required this.isCap,
      required this.isTShirt,
      this.title,
      this.priceFrom,
      this.priceTo});

  @override
  final bool isCap;
  @override
  final bool isTShirt;
  @override
  final String? title;
  @override
  final int? priceFrom;
  @override
  final int? priceTo;

  @override
  String toString() {
    return 'ProductsEvent.loadProducts(isCap: $isCap, isTShirt: $isTShirt, title: $title, priceFrom: $priceFrom, priceTo: $priceTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductsImpl &&
            (identical(other.isCap, isCap) || other.isCap == isCap) &&
            (identical(other.isTShirt, isTShirt) ||
                other.isTShirt == isTShirt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.priceFrom, priceFrom) ||
                other.priceFrom == priceFrom) &&
            (identical(other.priceTo, priceTo) || other.priceTo == priceTo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isCap, isTShirt, title, priceFrom, priceTo);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductsImplCopyWith<_$LoadProductsImpl> get copyWith =>
      __$$LoadProductsImplCopyWithImpl<_$LoadProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isCap, bool isTShirt, String? title,
            int? priceFrom, int? priceTo)
        loadProducts,
    required TResult Function() loadRecommendedProducts,
  }) {
    return loadProducts(isCap, isTShirt, title, priceFrom, priceTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isCap, bool isTShirt, String? title, int? priceFrom,
            int? priceTo)?
        loadProducts,
    TResult? Function()? loadRecommendedProducts,
  }) {
    return loadProducts?.call(isCap, isTShirt, title, priceFrom, priceTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isCap, bool isTShirt, String? title, int? priceFrom,
            int? priceTo)?
        loadProducts,
    TResult Function()? loadRecommendedProducts,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(isCap, isTShirt, title, priceFrom, priceTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadRecommendedProducts value)
        loadRecommendedProducts,
  }) {
    return loadProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadRecommendedProducts value)? loadRecommendedProducts,
  }) {
    return loadProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadRecommendedProducts value)? loadRecommendedProducts,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(this);
    }
    return orElse();
  }
}

abstract class LoadProducts implements ProductsEvent {
  const factory LoadProducts(
      {required final bool isCap,
      required final bool isTShirt,
      final String? title,
      final int? priceFrom,
      final int? priceTo}) = _$LoadProductsImpl;

  bool get isCap;
  bool get isTShirt;
  String? get title;
  int? get priceFrom;
  int? get priceTo;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadProductsImplCopyWith<_$LoadProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadRecommendedProductsImplCopyWith<$Res> {
  factory _$$LoadRecommendedProductsImplCopyWith(
          _$LoadRecommendedProductsImpl value,
          $Res Function(_$LoadRecommendedProductsImpl) then) =
      __$$LoadRecommendedProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadRecommendedProductsImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$LoadRecommendedProductsImpl>
    implements _$$LoadRecommendedProductsImplCopyWith<$Res> {
  __$$LoadRecommendedProductsImplCopyWithImpl(
      _$LoadRecommendedProductsImpl _value,
      $Res Function(_$LoadRecommendedProductsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadRecommendedProductsImpl implements LoadRecommendedProducts {
  const _$LoadRecommendedProductsImpl();

  @override
  String toString() {
    return 'ProductsEvent.loadRecommendedProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadRecommendedProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isCap, bool isTShirt, String? title,
            int? priceFrom, int? priceTo)
        loadProducts,
    required TResult Function() loadRecommendedProducts,
  }) {
    return loadRecommendedProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isCap, bool isTShirt, String? title, int? priceFrom,
            int? priceTo)?
        loadProducts,
    TResult? Function()? loadRecommendedProducts,
  }) {
    return loadRecommendedProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isCap, bool isTShirt, String? title, int? priceFrom,
            int? priceTo)?
        loadProducts,
    TResult Function()? loadRecommendedProducts,
    required TResult orElse(),
  }) {
    if (loadRecommendedProducts != null) {
      return loadRecommendedProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadRecommendedProducts value)
        loadRecommendedProducts,
  }) {
    return loadRecommendedProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadRecommendedProducts value)? loadRecommendedProducts,
  }) {
    return loadRecommendedProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadRecommendedProducts value)? loadRecommendedProducts,
    required TResult orElse(),
  }) {
    if (loadRecommendedProducts != null) {
      return loadRecommendedProducts(this);
    }
    return orElse();
  }
}

abstract class LoadRecommendedProducts implements ProductsEvent {
  const factory LoadRecommendedProducts() = _$LoadRecommendedProductsImpl;
}
