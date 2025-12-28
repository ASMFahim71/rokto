// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_request_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DonationRequestController)
const donationRequestControllerProvider = DonationRequestControllerProvider._();

final class DonationRequestControllerProvider
    extends
        $AsyncNotifierProvider<
          DonationRequestController,
          List<DonationRequestModel>
        > {
  const DonationRequestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'donationRequestControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$donationRequestControllerHash();

  @$internal
  @override
  DonationRequestController create() => DonationRequestController();
}

String _$donationRequestControllerHash() =>
    r'2d050e17216afde833d292b76b2340543eaebf3d';

abstract class _$DonationRequestController
    extends $AsyncNotifier<List<DonationRequestModel>> {
  FutureOr<List<DonationRequestModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<DonationRequestModel>>,
              List<DonationRequestModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DonationRequestModel>>,
                List<DonationRequestModel>
              >,
              AsyncValue<List<DonationRequestModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
