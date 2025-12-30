// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_requests_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyRequestsController)
const myRequestsControllerProvider = MyRequestsControllerProvider._();

final class MyRequestsControllerProvider
    extends $AsyncNotifierProvider<MyRequestsController, List<Order>> {
  const MyRequestsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myRequestsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myRequestsControllerHash();

  @$internal
  @override
  MyRequestsController create() => MyRequestsController();
}

String _$myRequestsControllerHash() =>
    r'ba5c71105051fb56fc9e7f5ec33f8e1b716dc9af';

abstract class _$MyRequestsController extends $AsyncNotifier<List<Order>> {
  FutureOr<List<Order>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Order>>, List<Order>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Order>>, List<Order>>,
              AsyncValue<List<Order>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
