import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:role_base/admin.dart';
import 'package:role_base/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiple Login Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}







class Login extends StatefulWidget {
  const Login({Key? key}) :super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String username, passweord, status;

  String alert = "Ready for login";

  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();
  TextEditingController usernameInput =  TextEditingController();
  TextEditingController passwordInput =  TextEditingController();
  
  void logiProcess() async{

    if(_formkey.currentState!.validate()){


      // final url = Uri.parse("http://localhost/login/login.php");
       final url = Uri.parse("http://10.0.2.2/login/login.php"); 
      //mobile login url
final response = await http.post(url, body: {
  "username": usernameInput.text,
  "password": passwordInput.text,
});


        var dataUser = json.decode(response.body);

        if(dataUser.length < 1){

          setState(() {
            alert = "you can't login";
          });
        }else{
          setState(() {
            username = dataUser[0]["username"];
            var uid = dataUser[0]["id_user"];
            status = dataUser[0]["status"];
          });

          if(status == "admin"){

            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=> Admin(username: username,))
            );
          }else{
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => User(username: username,))
          );
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        color: Colors.lightBlue,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.circle
                  ),
                  child: const Center(
                    child: Icon(Icons.people, size: 50, color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 15,),
                

                const Text("Welcome...", style: TextStyle(fontSize:20, color: Colors.black87 ),),

                const SizedBox(height: 15,),

                Text(alert, style: const TextStyle(color: Colors.red),),

                const SizedBox(height: 15,),

                Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameInput,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)
                          ),
                          prefixIcon: Icon(Icons.mail_sharp, size:40,),
                          hintText: "Enter your username",
                          hintStyle: TextStyle(color: Colors.black),
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                              },
                      ),
                      const SizedBox(height: 20,),

                      TextFormField(
                        controller: passwordInput,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                          ),
                          prefixIcon: Icon(Icons.lock, size: 40,),
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.black87),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black87),
                        ),
                          validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                              },
                      ),
                      const SizedBox(height: 20,),
                      Card(
                        color: Colors.black,
                        elevation: 5,
                        child: SizedBox(
                          height: 50,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              logiProcess();
                            },
                            child:const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 20,color: Colors.white),
                              ),
                            ),
                          ),

                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
