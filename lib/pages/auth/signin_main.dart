import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'package:shopping_app/global/const.dart';
import 'package:shopping_app/services/auth.dart';
import 'package:shopping_app/widget/bottomErrorSheet.dart';
import 'package:shopping_app/widget/button.dart';
import 'package:shopping_app/widget/imageButton.dart';
import 'package:shopping_app/widget/textfield.dart';

class SigninMainPage extends StatelessWidget {
  SigninMainPage({super.key});
  
  TextEditingController emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    final _authProvider =  Provider.of<AuthenticationProvider>(context);
    emailController.text = Provider.of<EmailProvider>(context, listen: false).email;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                    child: Text(S.of(context).signin,style: Theme.of(context).textTheme.headlineLarge,),
                  )),
                MyTextField(
                  textColor: Theme.of(context).hintColor,
                  color: Theme.of(context).primaryColor,
                  labelText: S.of(context).emailAddres,
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
                    if (emailController.text.length != 0) {
                    Provider.of<EmailProvider>(context, listen: false).updateEmail(emailController.text);
                    context.go('/signin');
                    }else{
                      bottomErrorSheet.showError(context, S.of(context).enterYourEmailToContinue);
                      Future.delayed(Duration(seconds: 3), () {
                        context.pop();  
                      });
                    }
                  }
                ),
                Padding(
                  padding: a8,
                  child: Row(
                    children: [
                      Text(S.of(context).dontHaveAnAccount,style: Theme.of(context).textTheme.bodySmall,),
                      TextButton(
                        onPressed: (){
                          context.go('/signup');
                        }, 
                        child: Text(S.of(context).createOne,style: Theme.of(context).textTheme.headlineSmall,))
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: tb5,
                      child: MyIconButton(
                        image_path: "assets/icons/google.png",
                        text: S.of(context).continueWithGoogle, 
                        textColor: Theme.of(context).hintColor, 
                        text_size: medium, 
                        text_weight: w400, 
                        color: Theme.of(context).primaryColor, 
                        borderColor: Theme.of(context).primaryColor, 
                        onTap: () async {
                          await _authProvider.signInWithGoogle();
                          if (_authProvider.checkIfUserIsLoggedIn()) {
                          context.go('/home_page');
                          }  
                        }
                      ),
                    ),
                 ],
                )
              ],
            ),
          ),
        ),
      )
      );
  }
}