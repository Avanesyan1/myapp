import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'package:shopping_app/global/const.dart';
import 'package:shopping_app/services/auth.dart';
import 'package:shopping_app/services/cloud.dart';
import 'package:shopping_app/widget/bottomErrorSheet.dart';
import 'package:shopping_app/widget/button.dart';
import 'package:shopping_app/widget/textfield.dart';

class SignupPage extends StatelessWidget {
    SignupPage({super.key});

    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    
    @override
    Widget build(BuildContext context) {
      final _authProvider = Provider.of<AuthenticationProvider>(context);
      final _cloudProvider = Provider.of<CloudProvider>(context,listen: false);

      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: l16,
              child: Container(
                decoration:  BoxDecoration(
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
                      child: Text(S.of(context).createAccount,style: Theme.of(context).textTheme.headlineLarge,),
                    )),
                  MyTextField(
                    textColor: Theme.of(context).hintColor,
                    color: Theme.of(context).primaryColor,
                    labelText: S.of(context).firstname,
                    controller: firstnameController,
                    onChanged: (value){},
                  ),
                  MyTextField(
                    textColor: Theme.of(context).hintColor,
                    color: Theme.of(context).primaryColor,
                    labelText: S.of(context).lastname,
                    controller: lastnameController,
                    onChanged: (value){},
                  ), 
                  MyTextField(
                    textColor: Theme.of(context).hintColor,
                    color: Theme.of(context).primaryColor,
                    labelText: S.of(context).emailAddress,
                    controller: emailController,
                    onChanged: (value){},
                  ),
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
                    onTap: ()async{
                      if (
                        firstnameController.text.isNotEmpty &&
                        lastnameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty 
                      ){
                        await _authProvider.signUpWithEmailAndPassword(
                            emailController.text, 
                            passwordController.text
                        );
                        if(_authProvider.checkIfUserIsLoggedIn()) {
                          String? uid =  _authProvider.getUid();
                          //save userinfo
                          _cloudProvider.saveProfileData(
                            uid,
                            firstnameController.text, 
                            lastnameController.text, 
                            emailController.text, 
                            '' );
                          context.go('/home_page');
                        }else{
                        bottomErrorSheet.showError(context, S.of(context).failedToSignUpPleaseEnterTheCorrectEmail); 
                        Future.delayed(Duration(seconds: 3), () {
                        context.pop(); 
                      }); 
                        }
                      }else{
                        bottomErrorSheet.showError(context, S.of(context).pleaseFillInAllTheFields);
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