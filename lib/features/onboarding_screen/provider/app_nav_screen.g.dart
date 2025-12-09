// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_nav_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppNavScreen)
const appNavScreenProvider = AppNavScreenProvider._();

final class AppNavScreenProvider extends $NotifierProvider<AppNavScreen, int> {
  const AppNavScreenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appNavScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appNavScreenHash();

  @$internal
  @override
  AppNavScreen create() => AppNavScreen();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$appNavScreenHash() => r'93b168f87926f8ffba1cd89597ad499e87ae7b37';

abstract class _$AppNavScreen extends $Notifier<int> {
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
