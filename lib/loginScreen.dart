import 'package:book_dadyy/bottomnav.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:book_dadyy/colors.dart';
import 'package:book_dadyy/forgotp.dart';
import 'package:book_dadyy/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'constants.dart';
 class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

GlobalKey<FormState> formKey = GlobalKey<FormState>();
late String _email,_password;

 signIn(BuildContext context) async {
  FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)
  .catchError((onError){
    print(onError);
  }).then((authUser) {
if(authUser.user!=null){
Navigator.push(
     context, MaterialPageRoute(builder: (context) => const BottomNavBar()));

}
});
}

@override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width; 
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () =>FocusScope.of(context).unfocus() ,
        child: SingleChildScrollView(
          
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
              children: [
                Image.asset("assets/images/book.png",
                height: height *0.35,
                width: width,
                fit: BoxFit.cover,
              ),
                Container(
                height: height * 0.40,
                width: width,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  // ignore: prefer_const_constructors
                  gradient:LinearGradient(
                    stops: [0.4,0.9],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // ignore: prefer_const_literals_to_create_immutables
                    colors:[Colors.transparent,Colors.white,])
                 ),
              //  color: Colors.orange.withOpacity(0.3),
                ),
                    const Positioned(
                      bottom: 0,
                      left: 140,
                     right: 0,
                 child: Text(appName,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
            
              ],
            ),
              
               
              Padding(
                padding: EdgeInsets.only(left:10.0,top:20),
                child: Column(
                  children: [
                    Container(
                      child: Text("$loginstr",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                      decoration: BoxDecoration(gradient: LinearGradient(
                        colors:[primaryColor.withOpacity(0.3),Colors.transparent,],),
                      
                        border: Border(left: BorderSide(color: primaryColor,width: 3))),
                    ),
                  ], 
                )),
                 Padding(
                  padding:  EdgeInsets.all(10),
                  child: TextFormField(
                    onSaved: (value){
                      _email=value!;
      
                    },
                    validator: (email){
                      if(email!.isEmpty)
                        return "Please Enter Email";
                      else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
                        return "It is not a valid Email";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      prefixIcon: Icon(Icons.email,color: primaryColor,),
                      labelText: "Email Address",
                      labelStyle: TextStyle(color: primaryColor,fontSize: 20),
                  
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal :10.0,vertical: 10),
                  child: TextFormField(
                    onSaved: (value){
                        _password=value!;
      
                    },
                      validator: (password){
                      if(password!.isEmpty)
                        return "Please Enter Password";
                      else if(password.length < 8 || password.length >15)
                        return "Password length is Incorrect"; 
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      prefixIcon: Icon(Icons.lock,color: primaryColor,),
                      labelText: "Password",
                      labelStyle: TextStyle(color: primaryColor,fontSize: 20),
                  
                    ),
                  ),
                ),
               Align(
                alignment: Alignment.centerRight,
                    child: TextButton(onPressed:(){
                        Navigator.of(context).push(
                        // ignore: prefer_const_constructors
                        MaterialPageRoute(builder: (context) => forgotp()));
                    
                    }, child: const Text(forgetp),),
               ),
               Center(
                child: SizedBox(
                  height: height * 0.08,
                  width: width * 30,
                  child: TextButton(
                    
                    onPressed: (){
                      if(formKey.currentState!.validate())
                      {
                        formKey.currentState?.save();
                        signIn(context);  


                        /*if(_email == _email && _password==_password)
                        {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).push(
                        // ignore: prefer_const_constructors
                        MaterialPageRoute(builder: (context) => BottomNavBar()));
                        }*/
                      }
                      //##Authenticate and push to home page
                    },
                    child: const Text("Login to account",
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      backgroundColor: Color.fromARGB(255, 56, 209, 14),
                      color: Color.fromARGB(255, 255, 254, 254),
                    ),),
                  ),
                ),
               ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont' have an account?"),
                  TextButton(onPressed:(){
                    Navigator.of(context).push(
                        // ignore: prefer_const_constructors
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  }, child: const Text("Create Account",style: TextStyle(color: primaryColor,fontSize: 16),))
                ],
               ),
                
             
            ],
           ),
          ),
        ),
      )
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_email', _email));
    properties.add(StringProperty('_password', _password));
  }
}
