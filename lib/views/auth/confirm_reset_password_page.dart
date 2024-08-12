import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth_viewmodel.dart';

class ConfirmResetPasswordPage extends StatelessWidget {
  final String email;
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  ConfirmResetPasswordPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Reset Password'),
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: codeController,
                  decoration: InputDecoration(labelText: 'Verification Code'),
                ),
                TextField(
                  controller: newPasswordController,
                  decoration: InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.confirmPassword(
                      email,
                      codeController.text,
                      newPasswordController.text,
                    );
                    if (viewModel.errorMessage == null) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    } else {
                      // Show error
                    }
                  },
                  child: viewModel.isLoading
                      ? CircularProgressIndicator()
                      : Text('Confirm Password'),
                ),
                if (viewModel.errorMessage != null)
                  Text(
                    viewModel.errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
