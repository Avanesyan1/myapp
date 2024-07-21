import 'package:MyApp/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:MyApp/generated/l10n.dart';
import 'package:MyApp/global/const.dart';
import 'package:MyApp/widget/button.dart';
import 'package:MyApp/widget/bottomErrorSheet.dart';
import 'package:MyApp/widget/textfield.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

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
                    context.go('/signin_main');
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
                print(state.message);
              }
            },
            builder: (context, state) {
              String email = '';
              if (state is AuthEmailUpdated) {
                email = state.email;
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: a8,
                        child: Text(
                          S.of(context).signin,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
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
                      textColor: Colors.white,
                      text_size: medium,
                      text_weight: w400,
                      color: primary,
                      borderColor: primary,
                      onTap: () {
                        if (passwordController.text.length >= 6) {
                          print('Email: ${email}');
                          context.read<AuthBloc>().add(
                            AuthSignInRequested(
                              email: email,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          bottomErrorSheet.showError(
                            context,
                            S.of(context).incorrectEmailOrPassword,
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: a8,
                      child: Row(
                        children: [
                          Text(
                            S.of(context).forgotPassword,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () {
                              context.go('/forgot_password');
                            },
                            child: Text(
                              S.of(context).reset,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
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
