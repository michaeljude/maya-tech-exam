import 'package:flutter/material.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

abstract class BottomSheetHelper {
  static Future<T> showBottomSheet<T>(
    final BuildContext context,
    final Widget child,
  ) async {
    final result = await showSlidingBottomSheet<T>(
      context,
      builder: (final context) => SlidingSheetDialog(
        customBuilder:
            (final context, final scrollController, final sheetState) => child,
        snapSpec: const SnapSpec(snappings: [0.42], initialSnap: 0.42),
        color: Colors.white,
        cornerRadius: 16,
        extendBody: true,
      ),
      useRootNavigator: true,
    );

    return result as T;
  }
}
