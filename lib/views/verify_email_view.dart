import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yournotes/constants/routes.dart';
import 'package:yournotes/services/auth/auth_service.dart';
import 'package:yournotes/services/auth/bloc/auth_bloc.dart';
import 'package:yournotes/services/auth/bloc/auth_event.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
                "We've sent you a verification email. Please open it to verify your account"),
            const Text(
                "If you haven't received a verification email yet, please press the button below!"),
            TextButton(
              onPressed: () {
                //send verification email to user when pressed
                context.read<AuthBloc>().add(
                      const AuthEventSendEmailVerification(),
                    );
              },
              child: const Text('Send email verification.'),
            ),
            TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(
                      const AuthEventLogOut(),
                    );
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
