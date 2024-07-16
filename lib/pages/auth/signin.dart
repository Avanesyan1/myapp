import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'package:shopping_app/global/const.dart';
import 'package:shopping_app/services/auth.dart';
import 'package:shopping_app/widget/button.dart';
import 'package:shopping_app/widget/bottomErrorSheet.dart';
import 'package:shopping_app/widget/textfield.dart';

class SigninPage extends StatelessWidget {
  
  SigninPage({super.key});
 
  TextEditingController passwordController = TextEditingController();
  
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
                    context.go('/');
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
                    child: Text(S.of(context).signin,style: Theme.of(context).textTheme.headlineLarge,),
                  )),
                MyTextField(
                  textColor: Theme.of(context).hintColor,
                  color: Theme.of(context).primaryColor,
                  labelText: S.of(context).password,
                  controller: passwordController,
                  onChanged: (value){},
                ),
                MyButton(
                  text: S.of(context).continueText, 
                  textColor: white, 
                  text_size: medium, 
                  text_weight: w400, 
                  color: primary, 
                  borderColor: primary, 
                  onTap: () async {
                    await _authProvider.signInWithEmailAndPassword(Provider.of<EmailProvider>(context, listen: false).email, passwordController.text);
                    if (_authProvider.checkIfUserIsLoggedIn()) {
                      context.go('/home_page');
                    }else {
                      bottomErrorSheet.showError(context, S.of(context).incorrectEmailOrPassword);
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
                      Text(S.of(context).forgotPassword,style: Theme.of(context).textTheme.bodySmall,),
                      TextButton(
                        onPressed: (){
                          context.go('/forgot_password');
                        }, 
                        child: Text(S.of(context).reset,style: Theme.of(context).textTheme.headlineSmall,))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      );
  }
}