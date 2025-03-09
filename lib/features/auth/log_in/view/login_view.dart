import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_bar/custom_app_bar.dart';
import '../../sign_up/data/repos/auth_repo.dart';
import '../manager/log_in_bloc/log_in_bloc.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = "/LoginView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.transparent,
          title: 'Log In',
        ),
        backgroundColor: Colors.black,
        body: BlocProvider(
          create: (context) => LogInBloc(authRepo: getIt.get<AuthRepo>()),
            child: const LoginViewBody()
          ,)
      ,);
  }
}
