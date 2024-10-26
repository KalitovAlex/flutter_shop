// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConcertModel _$ConcertModelFromJson(Map<String, dynamic> json) {
  return _ConcertModel.fromJson(json);
}

/// @nodoc
mixin _$ConcertModel {
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get place =>
      throw _privateConstructorUsedError; // Добавлено поле "place"
  int get price => throw _privateConstructorUsedError;

  /// Serializes this ConcertModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConcertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConcertModelCopyWith<ConcertModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConcertModelCopyWith<$Res> {
  factory $ConcertModelCopyWith(
          ConcertModel value, $Res Function(ConcertModel) then) =
      _$ConcertModelCopyWithImpl<$Res, ConcertModel>;
  @useResult
  $Res call(
      {String uuid,
      String title,
      String date,
      List<String> images,
      DateTime createdAt,
      DateTime updatedAt,
      String place,
      int price});
}

/// @nodoc
class _$ConcertModelCopyWithImpl<$Res, $Val extends ConcertModel>
    implements $ConcertModelCopyWith<$Res> {
  _$ConcertModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConcertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? date = null,
    Object? images = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? place = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConcertModelImplCopyWith<$Res>
    implements $ConcertModelCopyWith<$Res> {
  factory _$$ConcertModelImplCopyWith(
          _$ConcertModelImpl value, $Res Function(_$ConcertModelImpl) then) =
      __$$ConcertModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String title,
      String date,
      List<String> images,
      DateTime createdAt,
      DateTime updatedAt,
      String place,
      int price});
}

/// @nodoc
class __$$ConcertModelImplCopyWithImpl<$Res>
    extends _$ConcertModelCopyWithImpl<$Res, _$ConcertModelImpl>
    implements _$$ConcertModelImplCopyWith<$Res> {
  __$$ConcertModelImplCopyWithImpl(
      _$ConcertModelImpl _value, $Res Function(_$ConcertModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConcertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? date = null,
    Object? images = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? place = null,
    Object? price = null,
  }) {
    return _then(_$ConcertModelImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConcertModelImpl implements _ConcertModel {
  const _$ConcertModelImpl(
      {required this.uuid,
      required this.title,
      required this.date,
      required final List<String> images,
      required this.createdAt,
      required this.updatedAt,
      required this.place,
      required this.price})
      : _images = images;

  factory _$ConcertModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConcertModelImplFromJson(json);

  @override
  final String uuid;
  @override
  final String title;
  @override
  final String date;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String place;
// Добавлено поле "place"
  @override
  final int price;

  @override
  String toString() {
    return 'ConcertModel(uuid: $uuid, title: $title, date: $date, images: $images, createdAt: $createdAt, updatedAt: $updatedAt, place: $place, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConcertModelImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      title,
      date,
      const DeepCollectionEquality().hash(_images),
      createdAt,
      updatedAt,
      place,
      price);

  /// Create a copy of ConcertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConcertModelImplCopyWith<_$ConcertModelImpl> get copyWith =>
      __$$ConcertModelImplCopyWithImpl<_$ConcertModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConcertModelImplToJson(
      this,
    );
  }
}

abstract class _ConcertModel implements ConcertModel {
  const factory _ConcertModel(
      {required final String uuid,
      required final String title,
      required final String date,
      required final List<String> images,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String place,
      required final int price}) = _$ConcertModelImpl;

  factory _ConcertModel.fromJson(Map<String, dynamic> json) =
      _$ConcertModelImpl.fromJson;

  @override
  String get uuid;
  @override
  String get title;
  @override
  String get date;
  @override
  List<String> get images;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get place; // Добавлено поле "place"
  @override
  int get price;

  /// Create a copy of ConcertModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConcertModelImplCopyWith<_$ConcertModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
