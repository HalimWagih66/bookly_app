part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInByEmailAndPasswordFailure extends LogInState{
  late final String errorMessage;
  LogInByEmailAndPasswordFailure(this.errorMessage);
}

final class LogInByEmailAndPasswordSuccess extends LogInState{}

final class LogInByEmailAndPasswordLoading extends LogInState{}

final class LogInByGoogleFailure extends LogInState{
  late final String errorMessage;
  LogInByGoogleFailure(this.errorMessage);
}

final class LogInByGoogleSuccess extends LogInState{}

final class LogInByGoogleLoading extends LogInState{}

final class ResendEmailActiveFailure extends LogInState{
  late final String errorMessage;
  ResendEmailActiveFailure(this.errorMessage);
}

final class ResendEmailActiveSuccess extends LogInState{}

final class ResendEmailActiveLoading extends LogInState{}