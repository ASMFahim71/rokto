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
        $NotifierProvider<
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DonationRequestModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DonationRequestModel>>(value),
    );
  }
}

String _$donationRequestControllerHash() =>
    r'9c16dcac1a866a89ea99577f8146286392261246';

abstract class _$DonationRequestController
    extends $Notifier<List<DonationRequestModel>> {
  List<DonationRequestModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<List<DonationRequestModel>, List<DonationRequestModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                List<DonationRequestModel>,
                List<DonationRequestModel>
              >,
              List<DonationRequestModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
