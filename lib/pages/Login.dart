

import 'package:blocks/pages/Home.dart';
import 'package:blocks/provider/auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  checkToken() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString('token') != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homes()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userOn = Provider.of<Logins>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Image.asset('assets/images/Login.png'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'enter your email',
              labelText: ' email ',
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(
              hintText: 'enter your password',
              labelText: ' password',
            ),
          ),
          SizedBox(
            height: 22,
          ),

          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                userOn.getApiCall(
                    emailController.text, passController.text, context);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
