import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helper/text_style.dart';

class AdaptiveDialog {
  AdaptiveDialog._();
  static final instance = AdaptiveDialog._();

  Widget adaptiveAction(
      {required BuildContext context,
      required VoidCallback onPressed,
      required Widget child}) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  void show({
    required BuildContext context,
    required String accept,
    String? cancel,
    required String title,
    required String description,
    VoidCallback? callback,
  }) {
    showAdaptiveDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog.adaptive(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.bolt_rounded),
            Text(
              title,
              style: AppTextStyle.instance.titleDialog,
            ),
          ],
        ),
        content: Text(
          description,
          style: AppTextStyle.instance.bodyDialog,
        ),
        scrollable: true,
        actions: <Widget>[
          if (cancel != null) ...[
            adaptiveAction(
              context: context,
              onPressed: () => context.pop(),
              child: Text(
                cancel,
                style: AppTextStyle.instance.cancelDialog,
              ),
            ),
          ],
          adaptiveAction(
            context: context,
            onPressed: callback ?? () => context.pop(),
            child: Text(
              accept,
              style: AppTextStyle.instance.okDialog,
            ),
          ),
        ],
      ),
      barrierDismissible: false,
      useSafeArea: true,
    );
  }
}
