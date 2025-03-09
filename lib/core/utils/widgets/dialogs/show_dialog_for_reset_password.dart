import 'package:bookly_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/auth/reset_password_bloc/reset_password_bloc.dart';
import '../../../../features/auth/sign_up/data/repos/auth_repo.dart';
import '../../../../main.dart';
import '../../../services/service_locator.dart';
import '../TextFormField/custom_form_field.dart';
import '../buttons/custom_ink_will.dart';
import '../functions/validate/validate_inputs_from_text_valid.dart';
import '../loading/custom_hexagon_dots_loading.dart';


Future<void> showDialogForResetPassword(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => ResetPasswordBloc(authRepo: getIt.get<AuthRepo>()),
        child: const FittedBox(child: CustomAlertDialogFoResetPassword()),
      );
    },
  );
}

class CustomAlertDialogFoResetPassword extends StatefulWidget {
  const CustomAlertDialogFoResetPassword({super.key});

  @override
  State<CustomAlertDialogFoResetPassword> createState() =>
      _CustomAlertDialogFoResetPasswordState();
}

class _CustomAlertDialogFoResetPasswordState
    extends State<CustomAlertDialogFoResetPassword> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return AlertDialog(
      elevation: 0,
      backgroundColor: themeApp.secondColor,
      title: Text(
        "Reset Password",
        style: themeApp.textStyle18(context)
            .copyWith(color: themeApp.primaryColor),
        textAlign: TextAlign.start,
      ),
      content: Form(
        key: formKey,
        child: CustomTextFormField(
          functionValidate: (input) {
            email = input!;
            return ValidateInputsFromTextValid.validateEmailValid(email);
          },
          hintText: "Email Address",
          prefixIcon: Icons.email_outlined,
        ),
      ),
      actions: [
        CustomInkWill(
          background: Colors.red,
          child: Text(
            "Cancel",
            style: themeApp.textStyle14(context)
                .copyWith(color: themeApp.secondColor),
          ),
        ),
        CustomInkWill(
          background: Colors.green,
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<ResetPasswordBloc>(context)
                  .add(ResetPassword(email));
            }
          },
          child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordFailure) {
                GoRouter.of(context).pop();
                showMessageWithSnackBar(
                    background: themeApp.primaryColor,
                    message: state.errorMessage,
                    context: context);
              } else if (state is ResetPasswordSuccess) {
                GoRouter.of(context).pop();
                showMessageWithSnackBar(
                    background: themeApp.primaryColor,
                    message:
                        "An email has been sent to your email to change your password.",
                    context: context);
              }
            },
            builder: (context, state) {
              if (state is ResetPasswordLoading) {
                return FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                    child: CustomHexagonDotsLoading(
                        color: themeApp.secondColor),
                  ),
                );
              }
              return Text(
                "Send",
                style: themeApp.textStyle14(context)
                    .copyWith(color: themeApp.secondColor),
              );
            },
          ),
        ),
      ],
    );
  }
}
