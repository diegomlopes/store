// lib/screens/sign_up_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/views/auth/verification_page.dart';

import '../../viewmodels/auth_viewmodel.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                if (viewModel.isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () async {
                      await viewModel.signUp(
                        _emailController.text,
                        _passwordController.text,
                      );
                      if (viewModel.errorMessage == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationPage(
                              email: _emailController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('Sign Up'),
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
