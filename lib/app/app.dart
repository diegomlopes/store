import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/viewmodels/auth_viewmodel.dart';
import '../views/auth/login_page.dart';
import '../views/home/home_page.dart';
import '../views/cart/cart_page.dart';
import '../views/products/product_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<AuthViewModel>(
        builder: (context, auth, _) {
          return auth.isAuthenticated ? HomePage() : LoginPage();
        },
      ),
      routes: {
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
        '/products': (context) => ProductListPage(),
      },
    );
  }
}
