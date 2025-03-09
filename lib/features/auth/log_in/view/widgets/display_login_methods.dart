import 'package:bookly_app/core/utils/widgets/dialogs/show_message_with_snack_bar_for_resend_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import '../../../../../core/utils/widgets/buttons/custom_elevated_button.dart';
import '../../../../../core/utils/widgets/loading/custom_hexagon_dots_loading.dart';
import '../../../../../main.dart';
import '../../../sign_up/presentation/view/widgets/display_sign_up_with_method.dart';
import '../../manager/log_in_bloc/log_in_bloc.dart';

class DisplayLoginMethods extends StatelessWidget {
  const DisplayLoginMethods({super.key, required this.onPressedLoginByEmail});

  final void Function() onPressedLoginByEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
            background: const Color(0xff8599ff),
            onPressed: onPressedLoginByEmail,
            child: BlocConsumer<LogInBloc, LogInState>(
              listener: (context, state) {
                if (state is LogInByEmailAndPasswordFailure) {
                  if (state.errorMessage == "Activate your account dear") {
                    showMessageWithSnackBarForResendEmail(
                      message: state.errorMessage,
                      context: context,
                      background: themeApp.primaryColor,
                    );
                  } else {
                    showMessageWithSnackBar(
                        message: state.errorMessage,
                        context: context,
                        background: themeApp.primaryColor);
                  }
                } else if (state is LogInByEmailAndPasswordSuccess) {
                  showMessageWithSnackBar(
                      message: "You have successfully logged in, dear.",
                      context: context,
                      background: themeApp.primaryColor
                  );
                }
              },
              builder: (context, state) {
                if (state is LogInByEmailAndPasswordLoading) {
                  return CustomHexagonDotsLoading(color: themeApp.primaryColor);
                } else {
                  return Text("Login With Email", style: themeApp.textStyle18(context));
                }
              },
            )),
        const SizedBox(height: 15),
        CustomElevatedButton(
            background: const Color(0xfff0f5f2),
            onPressed: () {
              BlocProvider.of<LogInBloc>(context).add(LogInByGoogle());
            },
            child: BlocConsumer<LogInBloc, LogInState>(
              listener: (context, state) {
                if (state is LogInByGoogleFailure) {
                  showMessageWithSnackBar(
                      message: state.errorMessage,
                      context: context,
                      background: themeApp.primaryColor);
                } else if (state is LogInByGoogleSuccess) {
                  showMessageWithSnackBar(
                      message: "You have successfully logged in, dear.",
                      context: context,
                      background: themeApp.primaryColor);
                }
              },
              builder: (context, state) {
                if (state is LogInByGoogleLoading) {
                  return CustomHexagonDotsLoading(color: themeApp.primaryColor);
                } else {
                  return DisplayRegistrationBySocial(
                      text: "Login With Google",
                      image: "assets/images/auth/google-logo.png",
                      colorText: themeApp.secondColor);
                }
              },
            ),
        ),
      ],
    );
  }
}
