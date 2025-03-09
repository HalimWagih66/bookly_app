import 'package:bookly_app/features/auth/sign_up/presentation/view/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_bar/custom_app_bar.dart';
import '../../data/repos/auth_repo.dart';
import '../manager/sign_up_bloc/sign_up_bloc.dart';

class SignUpView extends StatelessWidget  {
  const SignUpView({super.key});
  static const routeName = "/SignUpView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(
       title: "Sign Up",
       backgroundColor: Colors.transparent,
     ),
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) => SignUpBloc(authRepo: getIt.get<AuthRepo>()),
        child: const SignUpViewBody(),
      ),
    );
  }
}