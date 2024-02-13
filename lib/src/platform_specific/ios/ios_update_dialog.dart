import 'package:flutter/cupertino.dart';
import 'package:simple_update_dialog/src/models/dialog_decoration.dart';

class IOSUpdateDialog extends StatelessWidget {
  final String title;
  final String message;
  final String positiveActionText;
  final String negativeActionText;
  final VoidCallback positiveActionCallback;
  final VoidCallback negativeActionCallback;
  final bool isForceUpdate;
  final DialogDecoration? dialogDecoration;
  const IOSUpdateDialog({
    super.key,
    required this.title,
    required this.message,
    required this.positiveActionText,
    required this.negativeActionText,
    required this.positiveActionCallback,
    required this.negativeActionCallback,
    required this.isForceUpdate,
    this.dialogDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: dialogDecoration?.titleStyle,
      ),
      content: Text(
        message,
        style: dialogDecoration?.messageStyle,
      ),
      actions: [
        if (!isForceUpdate)
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: negativeActionCallback.call,
            child: Text(
              negativeActionText,
              style: dialogDecoration?.negativeActionTextStyle,
            ),
          ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: positiveActionCallback.call,
          child: Text(
            positiveActionText,
            style: dialogDecoration?.positiveActionTextStyle,
          ),
        ),
      ],
    );
  }
}
