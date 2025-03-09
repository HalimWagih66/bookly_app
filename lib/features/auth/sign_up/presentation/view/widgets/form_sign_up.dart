import 'package:bookly_app/features/auth/sign_up/presentation/view/widgets/password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/widgets/TextFormField/custom_form_field.dart';
import '../../../../../../core/utils/widgets/functions/validate/validate_inputs_from_text_valid.dart';
import '../../manager/sign_up_bloc/sign_up_bloc.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context){
    BlocProvider.of<SignUpBloc>(context);
    return Column(
      children: [
        CustomTextFormField(
           hintText: "Enter Name",
            prefixIcon: Icons.person,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            functionValidate: (name) {
              BlocProvider.of<SignUpBloc>(context).userModel.name = name;
              return ValidateInputsFromTextValid.validateNameValid(input: name,outPut: "your first name");
            },
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: "Enter Email Address",
          prefixIcon: Icons.email_outlined,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          functionValidate: (email) {
            BlocProvider.of<SignUpBloc>(context).userModel.email = email;
            return ValidateInputsFromTextValid.validateEmailValid(email);
          },
        ),
        const SizedBox(height: 8),
        const PasswordForm(),
      ],
    );
  }
}
