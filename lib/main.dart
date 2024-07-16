import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/firebase_options.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'package:shopping_app/router/router.dart';
import 'package:shopping_app/services/auth.dart';
import 'package:shopping_app/services/cloud.dart';
import 'package:shopping_app/theme/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // theme 
  final MyTheme theme = MyTheme();
  final MyAppRouter myAppRouter = MyAppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CloudProvider>(
          create: (_) => CloudProvider(),
        ),
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<ApplicationUser>(
          create: (_) => ApplicationUser()
        ),
        ChangeNotifierProvider<EmailProvider>(
          create: (_) => EmailProvider()
        ),
      ],

      child: MaterialApp.router(
        localizationsDelegates: [
          S   .delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        
        theme: theme.light(),
        darkTheme: theme.dark(),
        
        routerDelegate: myAppRouter.router.routerDelegate,
        routeInformationParser: myAppRouter.router.routeInformationParser,
        routeInformationProvider: myAppRouter.router.routeInformationProvider,
      ),
    );
  }
}