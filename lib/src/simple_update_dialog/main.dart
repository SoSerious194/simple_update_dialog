import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_update_dialog/simple_update_dialog.dart';
import 'package:simple_update_dialog/src/common/app_update_checker.dart';
import 'package:simple_update_dialog/src/common/enums.dart';
import 'package:simple_update_dialog/src/widgets/update_dialog.dart';

/// A simple update dialog.
class SimpleUpdateDialog {
  /// [context] is used to match the style of the dialog with rest of the app theme
  ///
  /// [dialogConfig] sets crucial parameters for the update dialog to work
  ///
  /// [title] sets the title of the update dialog
  ///
  /// [message] sets the content of the dialog
  ///
  /// by setting [isForceUpdate] to true forces user to update the app
  ///
  /// [dialogDecoration] sets the styling of different components used in the update dialog
  ///
  /// [thenCallback] can be used to execute some code after the dialog is dismissed
  ///
  /// [positiveActionText] sets the positive button text
  ///
  /// [negativeActionText] sets the negative button text
  ///
  /// [positiveActionCallback] to execute custom code when positive button is pressed
  ///
  /// [negativeActionCallback] to execute custom code when negative button is pressed
  ///
  static void showUpdateDialog({
    required BuildContext context,
    required DialogConfig dialogConfig,
    String title = 'Update Alert!',
    String message = 'There\'s a newer version of the app available',
    bool isForceUpdate = false,
    DialogDecoration? dialogDecoration,
    VoidCallback? thenCallback,
    String positiveActionText = 'Update',
    String negativeActionText = 'Maybe later',
    VoidCallback? positiveActionCallback,
    VoidCallback? negativeActionCallback,
  }) async {
    AppUpdateChecker appUpdateChecker = AppUpdateChecker();
    UpdateRequirement updateRequirement =
        await appUpdateChecker.checkLatestVersion(
      currentVersion: dialogConfig.currentVersion,
      latestAppVer: Platform.isIOS
          ? dialogConfig.latestIOSVersion
          : dialogConfig.latestAndroidVersion,
      minAppVerAllowed: Platform.isIOS
          ? dialogConfig.minIOSAppVerAllowed
          : dialogConfig.minAndroidAppVerAllowed,
    );

    bool showForceUpdate =
        isForceUpdate || updateRequirement == UpdateRequirement.compulsory;

    Future.delayed(
      Duration.zero,
      () {
        if (updateRequirement != UpdateRequirement.none && context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: !showForceUpdate,
            builder: (context) {
              return UpdateDialog(
                title: title,
                message: message,
                isForceUpdate: showForceUpdate,
                dialogConfig: dialogConfig,
                dialogDecoration: dialogDecoration,
                positiveActionText: positiveActionText,
                negativeActionText: negativeActionText,
                positiveActionCallback: positiveActionCallback,
                negativeActionCallback: negativeActionCallback,
              );
            },
          ).then((_) {
            if (thenCallback != null) {
              thenCallback.call();
            }
          });
        }
      },
    );
  }
}
