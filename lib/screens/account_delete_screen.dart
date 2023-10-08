import 'package:flutter/material.dart';
import 'package:rhouze_web/modules/account/account_delete_content.dart';


class AccountDeleteScreen extends StatelessWidget {
  static String pathScreen = "deleteAccount_screen";

  const AccountDeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text('Account'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 34,
              )),        
      ),
      body:  const SafeArea(child: AccountDeleteContent())
    );     
  }
}