import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokto/core/common/utils/app_color.dart';
import 'package:rokto/core/common/widgets/app_bar.dart';
import 'package:rokto/features/my_requests/controller/my_requests_controller.dart';
import 'package:rokto/features/my_requests/view/widgets/my_request_card.dart';

class MyRequestsScreen extends ConsumerWidget {
  const MyRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestsAsync = ref.watch(myRequestsControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildGlobalAppBar(context: context,title: "My Requests"),
      body: requestsAsync.when(
        data: (requests) {
          if (requests.isEmpty) {
            return const Center(
              child: Text("You haven't made any requests yet."),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 20.h,
              bottom: 20.h,
            ),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return MyRequestCard(
                order: request,
                onTap: () {
                  // TODO: Navigate to details or edit if needed
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 15.h),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
