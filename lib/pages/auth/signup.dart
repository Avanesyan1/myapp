import 'package:MyApp/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:MyApp/generated/l10n.dart';
import 'package:MyApp/global/const.dart';
import 'package:MyApp/widget/bottomErrorSheet.dart';
import 'package:MyApp/widget/button.dart';
import 'package:MyApp/widget/textfield.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Theme.of(context).hintColor,
                  onPressed: () {
                    context.go('/');
                  },
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: a16,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                context.go('/home_page');
              } else if (state is AuthError) {
                bottomErrorSheet.showError(context, state.message);
                Future.delayed(Duration(seconds: 3), () {
                  context.pop();
                });
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: centerLeft,
                      child: Padding(
                        padding: a8,
                        child: Text(
                          S.of(context).createAccount,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    MyTextField(
                      textColor: Theme.of(context).hintColor,
                      color: Theme.of(context).primaryColor,
                      labelText: S.of(context).firstname,
                      controller: firstnameController,
                      onChanged: (value) {},
                    ),
                    MyTextField(
                      textColor: Theme.of(context).hintColor,
                      color: Theme.of(context).primaryColor,
                      labelText: S.of(context).lastname,
                      controller: lastnameController,
                      onChanged: (value) {},
                    ),
                    MyTextField(
                      textColor: Theme.of(context).hintColor,
                      color: Theme.of(context).primaryColor,
                      labelText: S.of(context).emailAddress,
                      controller: emailController,
                      onChanged: (value) {},
                    ),
                    MyTextField(
                      textColor: Theme.of(context).hintColor,
                      color: Theme.of(context).primaryColor,
                      labelText: S.of(context).password,
                      controller: passwordController,
                      onChanged: (value) {},
                    ),
                    MyButton(
                      text: S.of(context).continueText,
                      textColor: white,
                      text_size: medium,
                      text_weight: w400,
                      color: primary,
                      borderColor: primary,
                      onTap: () {
                        if (firstnameController.text.isNotEmpty &&
                            lastnameController.text.isNotEmpty &&
                            emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          context.read<AuthBloc>().add(AuthSignUpRequested(
                            email: emailController.text,
                            password: passwordController.text,
                            firstname: firstnameController.text,
                            secondname: lastnameController.text,
                          ));
                        } else {
                          bottomErrorSheet.showError(
                              context, S.of(context).pleaseFillInAllTheFields);
                          Future.delayed(Duration(seconds: 3), () {
                            context.pop();
                          });
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
