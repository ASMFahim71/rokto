// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navbarprovider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NavbarIndex)
const navbarIndexProvider = NavbarIndexProvider._();

final class NavbarIndexProvider extends $NotifierProvider<NavbarIndex, int> {
  const NavbarIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navbarIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navbarIndexHash();

  @$internal
  @override
  NavbarIndex create() => NavbarIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$navbarIndexHash() => r'd18263ae09542b178f3bf3f91182521bf268ecff';

abstract class _$NavbarIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
