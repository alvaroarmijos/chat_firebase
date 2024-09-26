import 'package:chat_firebase/app/login/cubits/login/login_cubit.dart';
import 'package:chat_firebase/app/login/widgets/widgets.dart';
import 'package:chat_firebase/app/ui/colors.dart';
import 'package:chat_firebase/app/ui/drawables.dart';
import 'package:chat_firebase/app/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final loginCubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _loginState,
        child: Form(
          key: loginCubit.formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Log in',
                  style: textTheme.labelLarge?.copyWith(
                    decoration: TextDecoration.underline,
                    decorationThickness: 10,
                    decorationColor: theme.colorScheme.primary.withOpacity(0.7),
                  ),
                  children: [
                    TextSpan(
                      text: ' to Chateo',
                      style: textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome back! Sign in using your social account or email to continue us',
                style: TextStyle(
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton(
                      iconPath: AppDrawables.facebookIconDrawable,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SocialMediaButton(
                      iconPath: AppDrawables.googleIconDrawable,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SocialMediaButton(
                      iconPath: AppDrawables.appleIconDrawable,
                    ),
                  ],
                ),
              ),
              OnboardingDivider(
                color: AppColors.darkGrey,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  loginCubit.onEmailChange(value);
                },
                keyboardType: TextInputType.emailAddress,
                validator: EmailValidator.emailValidation,
                decoration: const InputDecoration(
                  label: Text('Your email'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  loginCubit.onPasswordChange(value);
                },
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
              const SizedBox(height: 92),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(
          bottom: 48 + keyboardHeight,
        ),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state.status == Status.inProgress) {
              return const SizedBox(
                height: 48,
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }
            return ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                loginCubit.logIn();
              },
              child: const Text('Log in'),
            );
          },
        ),
      ),
    );
  }

  void _loginState(BuildContext context, LoginState state) {
    if (state.status == Status.failed) {
      Fluttertoast.showToast(msg: 'Intenta nuevamente...');
    }
  }
}
