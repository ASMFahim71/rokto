// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_info_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DetailInfoController)
const detailInfoControllerProvider = DetailInfoControllerProvider._();

final class DetailInfoControllerProvider
    extends $NotifierProvider<DetailInfoController, bool> {
  const DetailInfoControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'detailInfoControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$detailInfoControllerHash();

  @$internal
  @override
  DetailInfoController create() => DetailInfoController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$detailInfoControllerHash() =>
    r'479de0ff0b2e41daa441d12655472f0bdbd92d91';

abstract class _$DetailInfoController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
