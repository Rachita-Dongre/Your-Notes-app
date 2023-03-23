import 'package:flutter/material.dart';

typedef CloseDialog = void Function();

CloseDialog showLoadingDialog({
  required BuildContext context,
  required String text,
}) {
  final dialog = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          height: 10.0,
        ),
        Text(text),
      ],
    ),
  );

  showDialog(
    context: context,
    barrierDismissible:
        false, //allows or disallows the user to dismiss the dialog by tapping outside of it.
    builder: (context) => dialog,
  );

  return () => Navigator.of(context).pop();
}
