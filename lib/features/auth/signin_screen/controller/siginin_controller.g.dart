// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siginin_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SigininController)
const sigininControllerProvider = SigininControllerProvider._();

final class SigininControllerProvider
    extends $NotifierProvider<SigininController, SigninState> {
  const SigininControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sigininControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sigininControllerHash();

  @$internal
  @override
  SigininController create() => SigininController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SigninState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SigninState>(value),
    );
  }
}

String _$sigininControllerHash() => r'84212fb8ac4aa9512cfd99a4e8d6da1533d2f2f9';

abstract class _$SigininController extends $Notifier<SigninState> {
  SigninState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SigninState, SigninState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SigninState, SigninState>,
              SigninState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
