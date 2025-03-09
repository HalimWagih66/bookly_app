import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../sign_up/data/repos/auth_repo.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  String? emailAddress;
  AuthRepo authRepo;
  String? password;
  LogInBloc({required this.authRepo}) : super(LogInInitial()) {
    on<LogInEvent>(
      (event, emit) async {
        if (event is LogInByEmailAndPassword) {
          emit(LogInByEmailAndPasswordLoading());
          var result = await authRepo.loginWithEmailAndPassword(emailAddress: emailAddress!, password: password!);
          result.fold((failure) {
            emit(LogInByEmailAndPasswordFailure(failure.message));
          }, (user) {
            emit(LogInByEmailAndPasswordSuccess());
          },);
        }else if(event is LogInByGoogle){
          emit(LogInByGoogleLoading());
          var result = await authRepo.signInByGoogle();
          result.fold((failure) {
            emit(LogInByGoogleFailure(failure.message));
          }, (user) {
            emit(LogInByGoogleSuccess());
          },);
        }else if(event is ResendEmailForActive){
          emit(ResendEmailActiveLoading());
          var result = await authRepo.resendEmailActive();
          result.fold((l) {
            emit(ResendEmailActiveFailure(l.message));
          }, (r) {
            emit(ResendEmailActiveSuccess());
          },);
        }
      },
    );
  }
}
