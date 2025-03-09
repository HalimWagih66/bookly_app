import 'package:get_it/get_it.dart';
import '../../features/auth/sign_up/data/repos/auth_repo.dart';
import '../../features/auth/sign_up/data/repos/auth_repo_impl.dart';
import 'auth/services/auth_services.dart';
import 'auth/services_impl/firebase_auth_service.dart';
import 'database/database_firebase/firebase_database.dart';
import 'database/database_services/database_services.dart';


final getIt = GetIt.instance;
void setupServiceLocator(){
    getIt.registerSingleton<AuthServices>(FirebaseAuthServices());
    getIt.registerSingleton<DatabaseServices>(FirebaseDataBase());
    getIt.registerSingleton<AuthRepo>(
        AuthRepoImpl(
            databaseServices: getIt<DatabaseServices>(),
            authServices: getIt<AuthServices>()
        ),
    );
}