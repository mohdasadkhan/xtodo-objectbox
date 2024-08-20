import 'package:freezed_annotation/freezed_annotation.dart';

const Freezed freezedState = Freezed(
  copyWith: true,
  equal: true,
  makeCollectionsUnmodifiable: true,
  toStringOverride: true,
  map: FreezedMapOptions.none,
  fromJson: false,
  toJson: false,
);

/// Generates [freezed] code with `copyWith`, equality operators, and
/// `when`+`whenOrNull`+`maybeWhen` methods.
const Freezed freezedModel = Freezed(
  copyWith: true,
  equal: true,
  makeCollectionsUnmodifiable: true,
  toStringOverride: true,
  map: FreezedMapOptions.none,
);

/// Just like [freezedModel] but generates `map`, `mapOrNull`, and `maybeMap` methods instead.
const Freezed freezedModelWithMap = Freezed(
  copyWith: true,
  equal: true,
  makeCollectionsUnmodifiable: true,
  toStringOverride: true,
  when: FreezedWhenOptions.none,
);

/// Generates [freezed] code with `copyWith`, equality operators, and
/// `when`+`whenOrNull`+`maybeWhen` methods.
const Freezed freezedEntity = Freezed(
  copyWith: true,
  equal: true,
  makeCollectionsUnmodifiable: true,
  toStringOverride: false,
  map: FreezedMapOptions.none,
  fromJson: false,
  toJson: false,
);

/// Just like [freezedEntity] but generates `map`, `mapOrNull`, and `maybeMap` methods instead.
const Freezed freezedEntityWithMap = Freezed(
  copyWith: true,
  equal: true,
  makeCollectionsUnmodifiable: true,
  toStringOverride: false,
  when: FreezedWhenOptions.none,
  fromJson: false,
  toJson: false,
);
