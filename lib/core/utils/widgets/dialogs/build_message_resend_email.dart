import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/auth/log_in/manager/log_in_bloc/log_in_bloc.dart';
import '../../../../main.dart';

class BuildMessageResendEmail extends StatelessWidget {
  const BuildMessageResendEmail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
      builder: (context, state) {
        if (state is ResendEmailActiveSuccess) {
          return const Icon(Icons.done);
        }
        if (state is ResendEmailActiveLoading) {
          return const Icon(Icons.send_and_archive_outlined);
        } else if (state is ResendEmailActiveFailure) {
          return const Icon(Icons.warning_amber_outlined);
        } else {
          return TextButton(
            style: TextButton.styleFrom(shadowColor: Colors.transparent,foregroundColor: Colors.transparent,elevation: 0,overlayColor: Colors.transparent),
            onPressed: () {
              BlocProvider.of<LogInBloc>(context).add(ResendEmailForActive());
            },
              child: Row(
                children: [
                  Text("Activate your account dear",style: themeApp.textStyle16(context).copyWith(color: themeApp.secondColor),),
                  const Spacer(),
                  Text("Resend Email",style: themeApp.textStyle14(context).copyWith(color: const Color(0xaf373737))),
                ],
              ));
        }
      },
    );
  }
}
