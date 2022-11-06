// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'savedProduct.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedProductState {
  List<dynamic> get savedProductIds => throw _privateConstructorUsedError;
  List<dynamic> get savedProductNodes => throw _privateConstructorUsedError;
  int get savedProductCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedProductStateCopyWith<SavedProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedProductStateCopyWith<$Res> {
  factory $SavedProductStateCopyWith(
          SavedProductState value, $Res Function(SavedProductState) then) =
      _$SavedProductStateCopyWithImpl<$Res, SavedProductState>;
  @useResult
  $Res call(
      {List<dynamic> savedProductIds,
      List<dynamic> savedProductNodes,
      int savedProductCount});
}

/// @nodoc
class _$SavedProductStateCopyWithImpl<$Res, $Val extends SavedProductState>
    implements $SavedProductStateCopyWith<$Res> {
  _$SavedProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedProductIds = null,
    Object? savedProductNodes = null,
    Object? savedProductCount = null,
  }) {
    return _then(_value.copyWith(
      savedProductIds: null == savedProductIds
          ? _value.savedProductIds
          : savedProductIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      savedProductNodes: null == savedProductNodes
          ? _value.savedProductNodes
          : savedProductNodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      savedProductCount: null == savedProductCount
          ? _value.savedProductCount
          : savedProductCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedProductStateCopyWith<$Res>
    implements $SavedProductStateCopyWith<$Res> {
  factory _$$_SavedProductStateCopyWith(_$_SavedProductState value,
          $Res Function(_$_SavedProductState) then) =
      __$$_SavedProductStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> savedProductIds,
      List<dynamic> savedProductNodes,
      int savedProductCount});
}

/// @nodoc
class __$$_SavedProductStateCopyWithImpl<$Res>
    extends _$SavedProductStateCopyWithImpl<$Res, _$_SavedProductState>
    implements _$$_SavedProductStateCopyWith<$Res> {
  __$$_SavedProductStateCopyWithImpl(
      _$_SavedProductState _value, $Res Function(_$_SavedProductState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedProductIds = null,
    Object? savedProductNodes = null,
    Object? savedProductCount = null,
  }) {
    return _then(_$_SavedProductState(
      savedProductIds: null == savedProductIds
          ? _value._savedProductIds
          : savedProductIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      savedProductNodes: null == savedProductNodes
          ? _value._savedProductNodes
          : savedProductNodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      savedProductCount: null == savedProductCount
          ? _value.savedProductCount
          : savedProductCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SavedProductState extends _SavedProductState {
  const _$_SavedProductState(
      {final List<dynamic> savedProductIds = const [],
      final List<dynamic> savedProductNodes = const [],
      this.savedProductCount = 0})
      : _savedProductIds = savedProductIds,
        _savedProductNodes = savedProductNodes,
        super._();

  final List<dynamic> _savedProductIds;
  @override
  @JsonKey()
  List<dynamic> get savedProductIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedProductIds);
  }

  final List<dynamic> _savedProductNodes;
  @override
  @JsonKey()
  List<dynamic> get savedProductNodes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedProductNodes);
  }

  @override
  @JsonKey()
  final int savedProductCount;

  @override
  String toString() {
    return 'SavedProductState(savedProductIds: $savedProductIds, savedProductNodes: $savedProductNodes, savedProductCount: $savedProductCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedProductState &&
            const DeepCollectionEquality()
                .equals(other._savedProductIds, _savedProductIds) &&
            const DeepCollectionEquality()
                .equals(other._savedProductNodes, _savedProductNodes) &&
            (identical(other.savedProductCount, savedProductCount) ||
                other.savedProductCount == savedProductCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_savedProductIds),
      const DeepCollectionEquality().hash(_savedProductNodes),
      savedProductCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedProductStateCopyWith<_$_SavedProductState> get copyWith =>
      __$$_SavedProductStateCopyWithImpl<_$_SavedProductState>(
          this, _$identity);
}

abstract class _SavedProductState extends SavedProductState {
  const factory _SavedProductState(
      {final List<dynamic> savedProductIds,
      final List<dynamic> savedProductNodes,
      final int savedProductCount}) = _$_SavedProductState;
  const _SavedProductState._() : super._();

  @override
  List<dynamic> get savedProductIds;
  @override
  List<dynamic> get savedProductNodes;
  @override
  int get savedProductCount;
  @override
  @JsonKey(ignore: true)
  _$$_SavedProductStateCopyWith<_$_SavedProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
