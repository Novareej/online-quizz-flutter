import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_quizz/controller/api.dart';
import 'package:online_quizz/router.dart';
import 'package:online_quizz/screens/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  late File _file = File('');
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visibleLoading = false;

  Future register({required TextEditingController name,
    required TextEditingController email,
    required TextEditingController password, required BuildContext context, required Widget widget}) async{
    setState(() {
      visibleLoading = true;
    });

    String getName = name.text;
    String getEmail = email.text;
    String getPassword = password.text;

    var request = http.MultipartRequest('POST', Uri.parse(Api.baseUrl+Api.utils+Api.register));
       request.fields['name'] = getName;
    request.fields['email'] = getEmail;
    request.fields['password'] = getPassword;

    var response = await request.send();

    if(response.statusCode == 200){
      setState(() {
        visibleLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    }else{
      setState(() {
        visibleLoading = false;
      });
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text('Name or Email already on Database', style: TextStyle(
                color: Colors.blueAccent, fontSize: 19
              ),),
              actions: [
                GestureDetector(
                  onTap: ()=>Navigator.pop(context),
                  child: Text('Okay'),
                )
              ],
            );
          });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Text('Create Your Account Right Now', style: TextStyle(
                color: Colors.black, fontSize: 20
              ),),
              GestureDetector(
                
                child: Container(
                  margin: EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 20),
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.blueAccent),
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.blueAccent,),
                    filled: true,
                    fillColor: Colors.white54,
                    hintStyle: TextStyle(color: Colors.blue),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.blueAccent),
                  decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.blueAccent,),
                      filled: true,
                      fillColor: Colors.white54,
                      hintStyle: TextStyle(color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueAccent)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueAccent)
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                child: TextField(
                  controller: passwordController,
                  autofocus: false,
                  autocorrect: true,
                  style: TextStyle(color: Colors.blueAccent),
                  decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.blueAccent,),
                      filled: true,
                      fillColor: Colors.white54,
                      hintStyle: TextStyle(color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueAccent)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueAccent)
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7, bottom: 7),
                child: GestureDetector(
                  onTap: (){
                    register(name: nameController,
                        email: emailController,
                        password: passwordController,
                        context: context, widget: widget);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 7),
                    padding: EdgeInsets.only(top: 14, bottom: 14, right: 40, left: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blueAccent
                    ),
                    child: !visibleLoading ? Container(
                      width: 150,
                      child: Text('Create Account', style: TextStyle(
                          color: Colors.white, fontSize: 17
                      ), textAlign: TextAlign.center,),
                    ) : Visibility(visible: visibleLoading,
                      child: Container(
                        width: 150,
                        child: Center(
                          child: Container(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(strokeWidth: 1.6, color: Colors.red,),
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an Account?', style: TextStyle(fontSize: 17),),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          pushPage(context, Login());
                        },
                        child: Text('Login', style: TextStyle(color: Colors.blueAccent, fontSize: 17),),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              
            ],
          ),
        ),
      ),
    );
  }

  
}
