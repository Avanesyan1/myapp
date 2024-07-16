import 'package:go_router/go_router.dart';
import 'package:shopping_app/pages/auth/forgot_password.dart';
import 'package:shopping_app/pages/auth/send_email.dart';
import 'package:shopping_app/pages/auth/signin.dart';
import 'package:shopping_app/pages/auth/signin_main.dart';
import 'package:shopping_app/pages/auth/signup.dart';
import 'package:shopping_app/pages/home_page.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SigninMainPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => SigninPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/forgot_password',
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/send_email',
        builder: (context, state) => SendEmailPage(),
      ),
      GoRoute(
        path: '/home_page',
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}