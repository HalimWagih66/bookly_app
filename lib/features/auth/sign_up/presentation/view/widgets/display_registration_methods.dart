import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookly_app/features/auth/log_in/view/login_view.dart';
import 'package:bookly_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/widgets/dialogs/show_message_awesome_dialog.dart';
import '../../../../../../core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import '../../../../../../core/utils/widgets/loading/custom_hexagon_dots_loading.dart';
import '../../../../../../main.dart';
import '../../../../../on_boarding/presentation/display_guides/presentation/view/widget/custom_elevated_button.dart';
import '../../manager/sign_up_bloc/sign_up_bloc.dart';
import 'display_sign_up_with_method.dart';

class DisplayRegistrationMethods extends StatelessWidget {
  const DisplayRegistrationMethods({
    super.key, required this.titleButtonGoogle, required this.titleButtonWithEmail,required this.onPressedSigInWithEmail,required this.onPressedSigInWithGoogle});
  final String titleButtonGoogle;
  final String titleButtonWithEmail;
  final void Function() onPressedSigInWithGoogle;
  final void Function() onPressedSigInWithEmail;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
            onPressed: onPressedSigInWithEmail,
            background:  const Color(0xff8599ff),
            child:  BlocConsumer<SignUpBloc,SignUpState>(
              listener: (BuildContext context, SignUpState state) {
                if(state is SignUpWithEmailAndPasswordFailure){
                  showMessageWithSnackBar(message: state.errorMessage, context: context,background: themeApp.primaryColor);
                }else if(state is SignUpWithEmailAndPasswordSuccess){
                  showMessageWithAwesomeDialog(message: "An email has been sent to your personal email. Go to your email immediately and activate your account.",title: "Success", dialogType: DialogType.success,context: context,okActionName: "Ok",btnOkOnPress: () {
                    GoRouter.of(context).go(LoginView.routeName);
                  },);
                }
              },
              builder: (BuildContext context, SignUpState state) {
                  if(state is SignUpWithEmailAndPasswordLoading){
                    return CustomHexagonDotsLoading(color: themeApp.primaryColor);
                  }else{
                    return Text(titleButtonWithEmail,style: themeApp.textStyle18(context));
                  }
                },
          ),
        ),
        const SizedBox(height: 15),
        CustomElevatedButton(
            onPressed: () {
              BlocProvider.of<SignUpBloc>(context).add(SignUpWithGoogle());
            }, background: const Color(0xfff0f5f2),
            child: BlocConsumer<SignUpBloc,SignUpState>(
              listener: (context, state) {
                if(state is SignUpWithGoogleFailure){
                  showMessageWithSnackBar(message: state.errorMessage, context: context,background: themeApp.primaryColor);
                }
                else if(state is SignUpWithGoogleSuccess){
                  showMessageWithSnackBar(message: "You have successfully registered using Google.", context: context,background: themeApp.primaryColor);
                }
              },
                builder: (context, state) {
                  if(state is SignUpWithGoogleLoading){
                    return CustomHexagonDotsLoading(color: themeApp.primaryColor);
                  }else{
                    return DisplayRegistrationBySocial(text: titleButtonGoogle, image: Assets.authGoogleLogo,colorText: themeApp.secondColor,);
                  }
                },
            )
        ),
      ],
    );
  }
}