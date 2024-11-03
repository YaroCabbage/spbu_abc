// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alphabet_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlphabetEntry _$AlphabetEntryFromJson(Map<String, dynamic> json) {
  return _AlphabetEntry.fromJson(json);
}

/// @nodoc
mixin _$AlphabetEntry {
  String get letter => throw _privateConstructorUsedError;
  String get concept => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get definition => throw _privateConstructorUsedError;
  String get usage => throw _privateConstructorUsedError;
  List<int>? get imageData => throw _privateConstructorUsedError;

  /// Serializes this AlphabetEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlphabetEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlphabetEntryCopyWith<AlphabetEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlphabetEntryCopyWith<$Res> {
  factory $AlphabetEntryCopyWith(
          AlphabetEntry value, $Res Function(AlphabetEntry) then) =
      _$AlphabetEntryCopyWithImpl<$Res, AlphabetEntry>;
  @useResult
  $Res call(
      {String letter,
      String concept,
      String source,
      String definition,
      String usage,
      List<int>? imageData});
}

/// @nodoc
class _$AlphabetEntryCopyWithImpl<$Res, $Val extends AlphabetEntry>
    implements $AlphabetEntryCopyWith<$Res> {
  _$AlphabetEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlphabetEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = null,
    Object? concept = null,
    Object? source = null,
    Object? definition = null,
    Object? usage = null,
    Object? imageData = freezed,
  }) {
    return _then(_value.copyWith(
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      concept: null == concept
          ? _value.concept
          : concept // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlphabetEntryImplCopyWith<$Res>
    implements $AlphabetEntryCopyWith<$Res> {
  factory _$$AlphabetEntryImplCopyWith(
          _$AlphabetEntryImpl value, $Res Function(_$AlphabetEntryImpl) then) =
      __$$AlphabetEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String letter,
      String concept,
      String source,
      String definition,
      String usage,
      List<int>? imageData});
}

/// @nodoc
class __$$AlphabetEntryImplCopyWithImpl<$Res>
    extends _$AlphabetEntryCopyWithImpl<$Res, _$AlphabetEntryImpl>
    implements _$$AlphabetEntryImplCopyWith<$Res> {
  __$$AlphabetEntryImplCopyWithImpl(
      _$AlphabetEntryImpl _value, $Res Function(_$AlphabetEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlphabetEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = null,
    Object? concept = null,
    Object? source = null,
    Object? definition = null,
    Object? usage = null,
    Object? imageData = freezed,
  }) {
    return _then(_$AlphabetEntryImpl(
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      concept: null == concept
          ? _value.concept
          : concept // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: freezed == imageData
          ? _value._imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlphabetEntryImpl implements _AlphabetEntry {
  const _$AlphabetEntryImpl(
      {required this.letter,
      required this.concept,
      required this.source,
      required this.definition,
      required this.usage,
      required final List<int>? imageData})
      : _imageData = imageData;

  factory _$AlphabetEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlphabetEntryImplFromJson(json);

  @override
  final String letter;
  @override
  final String concept;
  @override
  final String source;
  @override
  final String definition;
  @override
  final String usage;
  final List<int>? _imageData;
  @override
  List<int>? get imageData {
    final value = _imageData;
    if (value == null) return null;
    if (_imageData is EqualUnmodifiableListView) return _imageData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AlphabetEntry(letter: $letter, concept: $concept, source: $source, definition: $definition, usage: $usage, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlphabetEntryImpl &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.concept, concept) || other.concept == concept) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            const DeepCollectionEquality()
                .equals(other._imageData, _imageData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, letter, concept, source,
      definition, usage, const DeepCollectionEquality().hash(_imageData));

  /// Create a copy of AlphabetEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlphabetEntryImplCopyWith<_$AlphabetEntryImpl> get copyWith =>
      __$$AlphabetEntryImplCopyWithImpl<_$AlphabetEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlphabetEntryImplToJson(
      this,
    );
  }
}

abstract class _AlphabetEntry implements AlphabetEntry {
  const factory _AlphabetEntry(
      {required final String letter,
      required final String concept,
      required final String source,
      required final String definition,
      required final String usage,
      required final List<int>? imageData}) = _$AlphabetEntryImpl;

  factory _AlphabetEntry.fromJson(Map<String, dynamic> json) =
      _$AlphabetEntryImpl.fromJson;

  @override
  String get letter;
  @override
  String get concept;
  @override
  String get source;
  @override
  String get definition;
  @override
  String get usage;
  @override
  List<int>? get imageData;

  /// Create a copy of AlphabetEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlphabetEntryImplCopyWith<_$AlphabetEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
