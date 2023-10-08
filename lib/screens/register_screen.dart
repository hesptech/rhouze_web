import 'package:flutter/material.dart';
import 'package:rhouze_web/modules/authentication/register_content.dart';

class RegisterScreen extends StatelessWidget {
  static String pathScreen = "register_screen";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text('Sign Up'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 34,
              )),
        ),
        resizeToAvoidBottomInset: false,
        body: const SafeArea(child: RegisterContent()));
  }
}