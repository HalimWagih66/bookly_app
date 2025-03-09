import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/services/auth/services/auth_services.dart';
import '../../../../../core/services/database/database_services/database_services.dart';
import '../../../../../core/utils/constant/sentence/sentence.dart';
import '../../../../../core/utils/errors/exceptions/exceptions.dart';
import '../../../../../core/utils/errors/failures.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.databaseServices,required this.authServices});
  DatabaseServices databaseServices;
  AuthServices authServices;

  @override
  Future<Either<Failure, UserModel>> createAccountWithEmailAndPassword({required UserModel userModel, required String password}) async{
    try {
      await authServices.createAccountWithEmailAndPassword(emailAddress: userModel.email!, password: password);
      await authServices.sendEmailVerification();
      await databaseServices.usersDatabase.createUserInDatabase(userModel: userModel);
      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpByGoogle()async {
    try {
      var user = await authServices.signInWithGoogle();
      if(user != null){
        UserModel userModel = UserModel(
            name: user.name,
            email: user.email,
        );
        await databaseServices.usersDatabase.createUserInDatabase(userModel: userModel);
        return right(userModel);
      }else{
        return left(UserFailure("Registration is not complete."));
      }
    } on Exception{
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }
  @override
  Future<Either<Failure, UserModel>> signInByGoogle()async {
    try {
      var user = await authServices.signInWithGoogle();
      if(user == null) {
        return left(UserFailure("Registration is not complete."));
      }
      return right(user);
    } on CustomException catch(e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }
  @override
  Future<Either<Failure, String?>> loginWithEmailAndPassword({required String emailAddress, required String password}) async{
    try {
      var uid = await authServices.loginWithEmailAndPassword(emailAddress: emailAddress, password: password);
      if(FirebaseAuth.instance.currentUser!.emailVerified == false){
        return left(ServerFailure("Activate your account dear"));
      }
      return right(uid);
    } on CustomException catch (e) {
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(String email) async{
    try{
      await authServices.resetPassword(email);
      return right(true);
    }on CustomException catch(e){
      return left(ServerFailure(e.errorMessage));
    }catch (e){
      return left(ServerFailure(Sentence.somethingWentWrongPleaseTryAgain));
    }
  }

}