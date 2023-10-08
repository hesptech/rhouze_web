import 'package:flutter/material.dart';
import 'package:rhouze_web/modules/authentication/register_finish_content.dart';

class RegisterFinishScreen extends StatelessWidget {
  static String pathScreen = "registerFinish";

  const RegisterFinishScreen({super.key});

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
        body: const SafeArea(child: RegisterFinishContent()));
  }
}