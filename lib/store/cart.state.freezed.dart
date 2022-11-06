// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  List<dynamic> get cartProductIds => throw _privateConstructorUsedError;
  List<dynamic> get cartProductNodes => throw _privateConstructorUsedError;
  int get cartProductCount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {List<dynamic> cartProductIds,
      List<dynamic> cartProductNodes,
      int cartProductCount,
      double total});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProductIds = null,
    Object? cartProductNodes = null,
    Object? cartProductCount = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      cartProductIds: null == cartProductIds
          ? _value.cartProductIds
          : cartProductIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      cartProductNodes: null == cartProductNodes
          ? _value.cartProductNodes
          : cartProductNodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      cartProductCount: null == cartProductCount
          ? _value.cartProductCount
          : cartProductCount // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_CartStateCopyWith(
          _$_CartState value, $Res Function(_$_CartState) then) =
      __$$_CartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> cartProductIds,
      List<dynamic> cartProductNodes,
      int cartProductCount,
      double total});
}

/// @nodoc
class __$$_CartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_CartState>
    implements _$$_CartStateCopyWith<$Res> {
  __$$_CartStateCopyWithImpl(
      _$_CartState _value, $Res Function(_$_CartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProductIds = null,
    Object? cartProductNodes = null,
    Object? cartProductCount = null,
    Object? total = null,
  }) {
    return _then(_$_CartState(
      cartProductIds: null == cartProductIds
          ? _value._cartProductIds
          : cartProductIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      cartProductNodes: null == cartProductNodes
          ? _value._cartProductNodes
          : cartProductNodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      cartProductCount: null == cartProductCount
          ? _value.cartProductCount
          : cartProductCount // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  const _$_CartState(
      {final List<dynamic> cartProductIds = const [],
      final List<dynamic> cartProductNodes = const [],
      this.cartProductCount = 0,
      this.total = 0.0})
      : _cartProductIds = cartProductIds,
        _cartProductNodes = cartProductNodes,
        super._();

  final List<dynamic> _cartProductIds;
  @override
  @JsonKey()
  List<dynamic> get cartProductIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProductIds);
  }

  final List<dynamic> _cartProductNodes;
  @override
  @JsonKey()
  List<dynamic> get cartProductNodes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProductNodes);
  }

  @override
  @JsonKey()
  final int cartProductCount;
  @override
  @JsonKey()
  final double total;

  @override
  String toString() {
    return 'CartState(cartProductIds: $cartProductIds, cartProductNodes: $cartProductNodes, cartProductCount: $cartProductCount, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            const DeepCollectionEquality()
                .equals(other._cartProductIds, _cartProductIds) &&
            const DeepCollectionEquality()
                .equals(other._cartProductNodes, _cartProductNodes) &&
            (identical(other.cartProductCount, cartProductCount) ||
                other.cartProductCount == cartProductCount) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartProductIds),
      const DeepCollectionEquality().hash(_cartProductNodes),
      cartProductCount,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {final List<dynamic> cartProductIds,
      final List<dynamic> cartProductNodes,
      final int cartProductCount,
      final double total}) = _$_CartState;
  const _CartState._() : super._();

  @override
  List<dynamic> get cartProductIds;
  @override
  List<dynamic> get cartProductNodes;
  @override
  int get cartProductCount;
  @override
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
