// lib/screens/verification_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/viewmodels/auth_viewmodel.dart';

class VerificationPage extends StatelessWidget {
  final String email;
  final TextEditingController _codeController = TextEditingController();

  VerificationPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email'),
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('A verification code has been sent to $email.'),
                TextField(
                  controller: _codeController,
                  decoration: InputDecoration(labelText: 'Verification Code'),
                ),
                SizedBox(height: 20),
                if (viewModel.isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () async {
                      await viewModel.verifyCode(email, _codeController.text);
                      if (viewModel.errorMessage == null) {
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Verify'),
                  ),
                if (viewModel.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      viewModel.errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
