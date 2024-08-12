import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/views/auth/confirm_reset_password_page.dart';

import '../../viewmodels/auth_viewmodel.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.resetPassword(emailController.text);
                    if (viewModel.errorMessage == null) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ConfirmResetPasswordPage(
                          email: emailController.text,
                        ),
                      ));
                    } else {
                      // Show error
                    }
                  },
                  child: viewModel.isLoading
                      ? CircularProgressIndicator()
                      : Text('Reset Password'),
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
