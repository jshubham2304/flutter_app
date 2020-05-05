import 'package:firebase_auth/firebase_auth.dart';
class AuthService
{
  String name,pass;
  AuthService({this.name,this.pass});

  FirebaseAuth auth =  FirebaseAuth.instance;
 Future signIn() async{
    try{
      AuthResult result = auth.createUserWithEmailAndPassword(email: name, password: pass) as AuthResult;
      FirebaseUser user = result.user;
      if(user != null)
        {
          return "Successfully";
        }
      else
        {
          return result.toString();
        }
    }catch(e)
    {

    }
  }
}