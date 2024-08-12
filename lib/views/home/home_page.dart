// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/views/auth/login_page.dart';

import '../../viewmodels/auth_viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!viewModel.isAuthenticated) {
          return LoginPage();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  await viewModel.logout();
                },
              ),
            ],
          ),
          body: Center(
            child: Text('Welcome to the Home Screen!'),
          ),
        );
      },
    );
  }
}
