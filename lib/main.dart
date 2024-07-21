import 'package:MyApp/blocs/auth/auth_bloc.dart';
import 'package:MyApp/repositories/auth_repository.dart';
import 'package:MyApp/repositories/cloud_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:MyApp/firebase_options.dart';
import 'package:MyApp/generated/l10n.dart';
import 'package:MyApp/router/router.dart';
import 'package:MyApp/theme/theme.dart';

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

  // router 
  final MyAppRouter myAppRouter = MyAppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        authRepository: AuthRepository(),
        cloudRepository: CloudRepository()
        ),
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