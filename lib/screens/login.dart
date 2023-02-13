
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';


class loginscrren extends StatefulWidget {
  const loginscrren({Key? key}) : super(key: key);

  @override
  State<loginscrren> createState() => _loginscrrenState();
}

class _loginscrrenState extends State<loginscrren> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  List posts = [];
  Future getPost() async{
    var url = ' https://csupervisionapi.catalist-me.com/api/ ';

    var response = await http.get(Uri.parse(url));
    var responcebody = jsonDecode(response.body);


    setState(() {
      posts.addAll(responcebody);
    });
    print(posts);
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),

                Text(
                  'You have to sign in',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Enter your email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Enter your Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                MyButton(
                  onTap: () {

                  },

                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any account ? ",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                  ],
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
