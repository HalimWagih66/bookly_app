import 'package:bookly_app/core/services/service_locator.dart';
import 'package:bookly_app/features/auth/log_in/manager/log_in_bloc/log_in_bloc.dart';
import 'package:bookly_app/features/auth/sign_up/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import 'build_message_resend_email.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    showMessageWithSnackBarForResendEmail(
        {required Color background,
        required String message,
        required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: background,
      duration: const Duration(seconds: 5),
      content: BlocProvider(
        create: (context) => LogInBloc(authRepo: getIt.get<AuthRepo>()),
        child: const BuildMessageResendEmail(),
      ),
    ),
  );
}