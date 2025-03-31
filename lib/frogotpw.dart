import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(decoration: InputDecoration(hintText: 'Enter your email')),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle reset password
              },
              child: Text('Reset Password'),
            ),
            TextField(decoration: InputDecoration(hintText: 'Enter the verification code')),
          ],
        ),
      ),
    );
  }
}