import 'package:dartz/dartz.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/utils/errors/failures.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserModel>> createAccountWithEmailAndPassword({required UserModel userModel,required String password});
  Future<Either<Failure, String?>> loginWithEmailAndPassword({required String emailAddress, required String password});
  Future<Either<Failure, UserModel>> signInByGoogle();
  Future<Either<Failure, bool>> resetPassword(String email);
  Future<Either<Failure, UserModel>> signUpByGoogle();
  Future<Either<Failure, void>> resendEmailActive();
}