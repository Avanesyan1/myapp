import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:MyApp/generated/l10n.dart';
import 'package:MyApp/global/const.dart';
import 'package:MyApp/widget/button.dart';

class SendEmailPage extends StatelessWidget {
    SendEmailPage({super.key});
  
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: a16,
            child: Align(
              alignment: centerAlign,
              child: Column(
                mainAxisAlignment: center,
                children: [
                  Image.asset('assets/images/email.png',height: 150,),
                  const SizedBox(height: 10),
                  Text(S.of(context).weSentYouAnEmailTo,style: Theme.of(context).textTheme.headlineMedium),
                  Text(S.of(context).resetyourPassword,style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                  MyButton(
                    text: S.of(context).returnToLogin, 
                    textColor: white, 
                    text_size: 16, 
                    text_weight: w400, 
                    color: primary, 
                    borderColor: primary,
                    onTap: (){
                      context.go('/signin_main');
                    }
                  )
                ]
              ),
            ),
          ),
        )
        );
    }
  }