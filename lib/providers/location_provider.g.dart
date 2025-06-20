// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationRepositoryHash() =>
    r'2526190538b40cd146beb2ca33ce901ef47fe5f8';

/// See also [locationRepository].
@ProviderFor(locationRepository)
final locationRepositoryProvider =
    AutoDisposeProvider<LocationRepository>.internal(
      locationRepository,
      name: r'locationRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationRepositoryRef = AutoDisposeProviderRef<LocationRepository>;
String _$getCurrentLocationHash() =>
    r'b542432bc21552e209f706a2e7d3e294f09104ff';

/// See also [getCurrentLocation].
@ProviderFor(getCurrentLocation)
final getCurrentLocationProvider = AutoDisposeFutureProvider<Position>.internal(
  getCurrentLocation,
  name: r'getCurrentLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCurrentLocationRef = AutoDisposeFutureProviderRef<Position>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
