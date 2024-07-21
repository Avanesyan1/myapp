import 'package:MyApp/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:MyApp/generated/l10n.dart';
import 'package:MyApp/global/const.dart';
import 'package:MyApp/widget/bottomErrorSheet.dart';
import 'package:MyApp/widget/button.dart';
import 'package:MyApp/widget/imageButton.dart';
import 'package:MyApp/widget/textfield.dart';

class SigninMainPage extends StatelessWidget {
  SigninMainPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: a16,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                context.go('/home_page');
              } else if (state is AuthError) {
                print(state.message);
              } else if (state is AuthEmailUpdated) {
                emailController.text = state.email;
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
                          S.of(context).signin,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    MyTextField(
                      textColor: Theme.of(context).hintColor,
                      color: Theme.of(context).primaryColor,
                      labelText: S.of(context).emailAddres,
                      controller: emailController,
                      onChanged: (value) {
                      },
                    ),
                    MyButton(
                      text: S.of(context).continueText,
                      textColor: white,
                      text_size: medium,
                      text_weight: w400,
                      color: primary,
                      borderColor: primary,
                      onTap: () {
                        if (emailController.text.isNotEmpty) {
                          context.read<AuthBloc>().add(AuthSetEmailRequested(email: emailController.text));
                          context.go('/signin');
                        } else {
                          bottomErrorSheet.showError(context, S.of(context).enterYourEmailToContinue);
                          Future.delayed(Duration(seconds: 3), () {
                            context.pop();
                          });
                        }
                      },
                    ),
                    Padding(
                      padding: a8,
                      child: Row(
                        children: [
                          Text(
                            S.of(context).dontHaveAnAccount,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () {
                              context.go('/signup');
                            },
                            child: Text(
                              S.of(context).createOne,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        onTap: () {
                          context.read<AuthBloc>().add(AuthGoogleSignInRequested());
                        },
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
