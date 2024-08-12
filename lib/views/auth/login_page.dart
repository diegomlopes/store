import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/viewmodels/auth_viewmodel.dart';
import 'package:store/views/auth/forgot_password_page.dart';
import 'package:store/views/auth/signup_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.login(
                      emailController.text,
                      passwordController.text,
                    );
                    if (viewModel.errorMessage == null) {
                      // Navigate to home screen
                    } else {
                      // Show error
                    }
                  },
                  child: viewModel.isLoading
                      ? CircularProgressIndicator()
                      : Text('Login'),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
                  },
                  child: Text('Not registered yet? Sign Up'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ));
                  },
                  child: Text('Forgot Password?'),
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
