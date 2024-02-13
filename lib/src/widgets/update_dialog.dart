import 'dart:developer';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:simple_update_dialog/simple_update_dialog.dart';
import 'package:simple_update_dialog/src/platform_specific/android/android_update_dialog.dart';
import 'package:simple_update_dialog/src/platform_specific/ios/ios_update_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateDialog extends StatelessWidget {
  final String title;
  final String message;
  final DialogConfig dialogConfig;
  final String positiveActionText;
  final String negativeActionText;
  final bool isForceUpdate;
  final DialogDecoration? dialogDecoration;
  final VoidCallback? positiveActionCallback;
  final VoidCallback? negativeActionCallback;

  const UpdateDialog({
    super.key,
    required this.title,
    required this.message,
    required this.dialogConfig,
    required this.positiveActionText,
    required this.negativeActionText,
    this.isForceUpdate = false,
    this.dialogDecoration,
    this.positiveActionCallback,
    this.negativeActionCallback,
  });

  @override
  Widget build(BuildContext context) {
    void launchStoreLink(String url) async {
      try {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        }
      } catch (e) {
        log(e.toString());
      }
    }

    return Platform.isIOS
        ? IOSUpdateDialog(
            title: title,
            message: message,
            dialogDecoration: dialogDecoration,
            positiveActionText: positiveActionText,
            negativeActionText: negativeActionText,
            isForceUpdate: isForceUpdate,
            positiveActionCallback: positiveActionCallback ??
                () {
                  Navigator.pop(context);
                  launchStoreLink(dialogConfig.appStoreUrl);
                },
            negativeActionCallback: negativeActionCallback ??
                () {
                  Navigator.pop(context);
                },
          )
        : AndroidUpdateDialog(
            title: title,
            message: message,
            dialogDecoration: dialogDecoration,
            positiveActionText: positiveActionText,
            negativeActionText: negativeActionText,
            isForceUpdate: isForceUpdate,
            positiveActionCallback: positiveActionCallback ??
                () {
                  Navigator.pop(context);
                  launchStoreLink(dialogConfig.playStoreUrl);
                },
            negativeActionCallback: negativeActionCallback ??
                () {
                  Navigator.pop(context);
                },
          );
  }
}
