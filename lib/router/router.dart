import 'package:MyApp/pages/auth/signin.dart';
import 'package:MyApp/pages/authCheck.dart';
import 'package:go_router/go_router.dart';
import 'package:MyApp/pages/auth/forgot_password.dart';
import 'package:MyApp/pages/auth/send_email.dart';
import 'package:MyApp/pages/auth/signin_main.dart';
import 'package:MyApp/pages/auth/signup.dart';
import 'package:MyApp/pages/home/home_page.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => AuthCheck(),
      ),
      GoRoute(
        path: '/signin_main',
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