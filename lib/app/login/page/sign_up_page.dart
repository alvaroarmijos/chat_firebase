import 'package:chat_firebase/app/login/cubits/sign_up/sign_up_cubit.dart';
import 'package:chat_firebase/app/ui/ui.dart';
import 'package:chat_firebase/app/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _globalKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final signUpCubit = context.read<SignUpCubit>();

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(),
      body: BlocListener<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _authListener,
        child: Form(
          key: signUpCubit.formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Sign up with ',
                  style: textTheme.labelLarge,
                  children: [
                    TextSpan(
                      text: 'Email',
                      style: textTheme.labelLarge?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 10,
                        decorationColor:
                            theme.colorScheme.primary.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Get chatting with friends and family today by signing up for our chat app!',
                style: TextStyle(
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  signUpCubit.onNameChange(value);
                },
                decoration: const InputDecoration(
                  label: Text('Your name'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  signUpCubit.onEmailChange(value);
                },
                keyboardType: TextInputType.emailAddress,
                validator: EmailValidator.emailValidation,
                decoration: const InputDecoration(
                  label: Text(
                    'Your email',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  signUpCubit.onPasswordChange(value);
                },
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  signUpCubit.onConfirmPasswordChange(value);
                },
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text(
                    'Confirm Password',
                  ),
                ),
                validator: (_) {
                  if (signUpCubit.state.status == Status.passwordMismatch) {
                    return 'Contraseñas no coinciden';
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
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
          bottom: 32 + keyboardHeight,
        ),
        child: BlocBuilder<SignUpCubit, SignUpState>(
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
                signUpCubit.createAccount();
              },
              child: const Text('Create an account'),
            );
          },
        ),
      ),
    );
  }

  void _authListener(BuildContext context, SignUpState state) {
    String? message;
    if (state.status == Status.failed) {
      message = 'Revisa tu conección...';
    } else if (state.status == Status.passwordTooWeak) {
      message = 'Contraseña débil...';
    } else if (state.status == Status.emailAllReadyRegistered) {
      message = 'Email ya se encuentra registrado';
    }

    if (message != null) {
      Fluttertoast.showToast(msg: message);
    }
  }
}
