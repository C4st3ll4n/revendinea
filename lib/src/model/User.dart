import 'package:parse_server_sdk/parse_server_sdk.dart';

const kUserId = "objectId";
const kUserName = "name";
const kUserPhone = "phone";
const kUserEmail = "email";
const kUserPassword = "password";
const kUserType = "type";

class User {
  String name, phone, email, password, id;
  UserType type;

  User(
      {this.name,
      this.phone,
      this.email,
      this.password,
      this.type = UserType.PARTICULAR});

  factory User.fromParse(ParseUser parseUser) {
    return User(
      name: parseUser.get(kUserName),
      email: parseUser.emailAddress,
      type: UserType.values[parseUser.get(kUserType)],
      phone: parseUser.get(kUserPhone)
      //password: parseUser.password,
      
    )..id = parseUser.objectId;
  }
}

enum UserType { PARTICULAR, PROFESSIONAL }
