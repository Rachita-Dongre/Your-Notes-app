import 'package:flutter/material.dart';
import 'package:yournotes/constants/routes.dart';
import 'package:yournotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify your email'),
      ),
      body: Column(
        children: [
          const Text(
              "We've sent you a verification email. Please open it to verify your account"),
          const Text(
              "If you haven't received a verification email yet, please press the button below!"),
          TextButton(
            onPressed: () async {
              //send verification email to user when pressed
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('Send email verification.'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
