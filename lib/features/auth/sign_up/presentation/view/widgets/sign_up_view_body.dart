import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/widgets/questions/user_question_about_registration.dart';
import '../../../../../../main.dart';
import '../../manager/sign_up_bloc/sign_up_bloc.dart';
import 'display_registration_methods.dart';
import 'form_sign_up.dart';


class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
  });
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Create Account", style: themeApp.textStyle30(context)),
                const SizedBox(height: 10),
                Text("Sign up to get Started!", style: themeApp.textStyle14(context)),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 25),
                Form(
                  key: _formKey,
                  child: const FormSignUp(),
                ),
                const SizedBox(height: 25),
                DisplayRegistrationMethods(
                  onPressedSigInWithEmail: () {
                    if(_formKey.currentState!.validate()){
                        BlocProvider.of<SignUpBloc>(context).add(SignUpWithEmailAndPassword());
                    }
                  },
                  titleButtonWithEmail: "Sign Up",
                  titleButtonGoogle: "Sign Up Using Google",
                  onPressedSigInWithGoogle: () {
                    BlocProvider.of<SignUpBloc>(context).add(SignUpWithGoogle());
                  },
                ),
                 const SizedBox(height: 18),
                 UserQuestionAboutRegistration(
                  questionText: "Already have an account?",
                  actionText: "Login",
                  routeName: "LoginView.routeName",
                ),
              ],
        ),
      ),
    );
  }
}