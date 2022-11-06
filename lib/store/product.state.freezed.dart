// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState {
  List<dynamic>? get productNodes => throw _privateConstructorUsedError;
  int? get productCount => throw _privateConstructorUsedError;
  bool get isStateError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {List<dynamic>? productNodes, int? productCount, bool isStateError});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productNodes = freezed,
    Object? productCount = freezed,
    Object? isStateError = null,
  }) {
    return _then(_value.copyWith(
      productNodes: freezed == productNodes
          ? _value.productNodes
          : productNodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      productCount: freezed == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isStateError: null == isStateError
          ? _value.isStateError
          : isStateError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductStateCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$_ProductStateCopyWith(
          _$_ProductState value, $Res Function(_$_ProductState) then) =
      __$$_ProductStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic>? productNodes, int? productCount, bool isStateError});
}

/// @nodoc
class __$$_ProductStateCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_ProductState>
    implements _$$_ProductStateCopyWith<$Res> {
  __$$_ProductStateCopyWithImpl(
      _$_ProductState _value, $Res Function(_$_ProductState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productNodes = freezed,
    Object? productCount = freezed,
    Object? isStateError = null,
  }) {
    return _then(_$_ProductState(
      productNodes: freezed == productNodes
          ? _value._productNodes
          : productNodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      productCount: freezed == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isStateError: null == isStateError
          ? _value.isStateError
          : isStateError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProductState extends _ProductState with DiagnosticableTreeMixin {
  const _$_ProductState(
      {final List<dynamic>? productNodes = null,
      this.productCount = null,
      this.isStateError = false})
      : _productNodes = productNodes,
        super._();

  final List<dynamic>? _productNodes;
  @override
  @JsonKey()
  List<dynamic>? get productNodes {
    final value = _productNodes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int? productCount;
  @override
  @JsonKey()
  final bool isStateError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductState(productNodes: $productNodes, productCount: $productCount, isStateError: $isStateError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductState'))
      ..add(DiagnosticsProperty('productNodes', productNodes))
      ..add(DiagnosticsProperty('productCount', productCount))
      ..add(DiagnosticsProperty('isStateError', isStateError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductState &&
            const DeepCollectionEquality()
                .equals(other._productNodes, _productNodes) &&
            (identical(other.productCount, productCount) ||
                other.productCount == productCount) &&
            (identical(other.isStateError, isStateError) ||
                other.isStateError == isStateError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productNodes),
      productCount,
      isStateError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductStateCopyWith<_$_ProductState> get copyWith =>
      __$$_ProductStateCopyWithImpl<_$_ProductState>(this, _$identity);
}

abstract class _ProductState extends ProductState {
  const factory _ProductState(
      {final List<dynamic>? productNodes,
      final int? productCount,
      final bool isStateError}) = _$_ProductState;
  const _ProductState._() : super._();

  @override
  List<dynamic>? get productNodes;
  @override
  int? get productCount;
  @override
  bool get isStateError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductStateCopyWith<_$_ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
