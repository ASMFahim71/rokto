// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateRequestController)
const createRequestControllerProvider = CreateRequestControllerProvider._();

final class CreateRequestControllerProvider
    extends $NotifierProvider<CreateRequestController, void> {
  const CreateRequestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createRequestControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createRequestControllerHash();

  @$internal
  @override
  CreateRequestController create() => CreateRequestController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$createRequestControllerHash() =>
    r'dabcad3f687376d5e615c87f5b107f287af499ff';

abstract class _$CreateRequestController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
