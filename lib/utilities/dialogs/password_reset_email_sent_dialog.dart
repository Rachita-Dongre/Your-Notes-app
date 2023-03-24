import 'package:flutter/material.dart';
import 'package:yournotes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content: 'We have sent you a password reset link. Please check your email.',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
