import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'app/configure_amplify.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/product_viewmodel.dart';
import 'viewmodels/cart_viewmodel.dart';
import 'viewmodels/order_viewmodel.dart';

void main() async {
  // Ensures that Flutter is fully initialized before executing asynchronous code. This is necessary for the Amplify configuration to work correctly.

  WidgetsFlutterBinding.ensureInitialized();

  // Configure Amplify
  await configureAmplify();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => ProductViewModel()),
        ChangeNotifierProvider(create: (context) => CartViewModel()),
        ChangeNotifierProvider(create: (context) => OrderViewModel()),
      ],
      child: const App(),
    ),
  );
}
