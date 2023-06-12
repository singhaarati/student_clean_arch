import 'package:flutter/material.dart';

import 'features/splash/presentation/view/splash_view.dart';
import 'view/batch_view.dart';
import 'view/login_view.dart';
import 'view/register_view.dart';

class App extends StatelessWidget {
  const App({super.key});

//Named Route

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.green,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashView(),
          '/login': (context) => const LoginView(),
          '/register': (context) => const RegisterView(),
          '/batch': (context) => const BatchView()
        });
  }
}
