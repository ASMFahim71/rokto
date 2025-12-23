// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportController)
const reportControllerProvider = ReportControllerProvider._();

final class ReportControllerProvider
    extends $NotifierProvider<ReportController, ReportState> {
  const ReportControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportControllerHash();

  @$internal
  @override
  ReportController create() => ReportController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportState>(value),
    );
  }
}

String _$reportControllerHash() => r'fe45e881a13d3cdb3471a9bade63cc4b33fd0e77';

abstract class _$ReportController extends $Notifier<ReportState> {
  ReportState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReportState, ReportState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReportState, ReportState>,
              ReportState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
