class UserModel{
  String? name;
  String? email;
  static const collectionName = "users";
  UserModel({this.name,this.email});

   factory UserModel.fromFJson(json){
    return UserModel(name: json['name'], email: json['email']);
  }
  Map<String,dynamic>toJson(){
     return {
       "name" : name,
       "email" : email,
     };
  }
}