import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:MyApp/generated/l10n.dart';
import 'package:MyApp/global/const.dart';
import 'package:MyApp/services/auth.dart';
import 'package:MyApp/widget/bottomErrorSheet.dart';
import 'package:MyApp/widget/button.dart';
import 'package:MyApp/widget/textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
    
  TextEditingController emailController = TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    
    final _authProvider =  Provider.of<AuthenticationProvider>(context);
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: l16,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: IconButton(
                  icon:const Icon( Icons.arrow_back_ios),
                  color: Theme.of(context).hintColor,
                  onPressed: (){
                    context.go('/signin');
                    }
                  )
                ),
            ),
          ),
        ),
        body: Padding(
          padding: a16,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: centerLeft,
                  child: Padding(
                    padding: a8,
                    child: Text(S.of(context).forgotPassword,style: Theme.of(context).textTheme.headlineLarge,),
                  )
                ),
                MyTextField(
                  textColor: Theme.of(context).hintColor,
                  color: Theme.of(context).primaryColor,
                  labelText: S.of(context).enterEmailAddress,
                  controller: emailController,
                  onChanged: (value){},
                ),
                MyButton(
                  text: S.of(context).continueText, 
                  textColor: white, 
                  text_size: medium, 
                  text_weight: w400, 
                  color: primary, 
                  borderColor: primary, 
                  onTap: (){
                    if (emailController.text.isNotEmpty) {
                      try {
                        _authProvider.resetPassword(emailController.text);
                        context.go('/send_emai;');
                      } catch (e) {
                        bottomErrorSheet.showError(context, S.of(context).pleaseInputCorrectEmail);
                        Future.delayed(Duration(seconds: 3), () {
                          context.pop();  
                          }
                        );
                      }
                    }else{
                      bottomErrorSheet.showError(context, S.of(context).enterYourEmailToContinue);
                      Future.delayed(Duration(seconds: 3), () {
                        context.pop();  
                      });
                      }
                  }
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}