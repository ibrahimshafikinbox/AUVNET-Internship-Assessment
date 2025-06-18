import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:auvnet_flutter_internship/core/Helper/asset_helper.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_event.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_state.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/widgets/email_input_field.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/widgets/login_button.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/widgets/password_input_field.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegisterPressed() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Passwords do not match!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      context.read<AuthBloc>().add(
            RegisterSubmitted(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  void _onLoginRedirectPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        Assets.logo,
                        height: 200,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.spaceLarge),
                  EmailInputField(controller: _emailController),
                  const SizedBox(height: AppDimens.spaceSmall),
                  PasswordInputField(
                    controller: _passwordController,
                    hintText: 'password',
                  ),
                  const SizedBox(height: AppDimens.spaceSmall),
                  PasswordInputField(
                    controller: _confirmPasswordController,
                    hintText: 'confirm password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppDimens.spaceLarge),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        onPressed: _onRegisterPressed,
                        text: 'Register',
                        isLoading: state is AuthLoading,
                      );
                    },
                  ),
                  const SizedBox(height: AppDimens.spaceMedium),
                  TextButton(
                    onPressed: _onLoginRedirectPressed,
                    child: const Text(
                      'Already have an account? Log in',
                      style: AppStyles.createAccountTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
