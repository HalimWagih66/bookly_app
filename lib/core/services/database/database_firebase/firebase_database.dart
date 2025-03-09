import '../database_services/database_interface/users_database.dart';
import 'database/users_database_firestore.dart';
import '../database_services/database_services.dart';

class FirebaseDataBase implements DatabaseServices{

  @override
  UsersDatabase usersDatabase = UsersDatabaseFirestore();

}