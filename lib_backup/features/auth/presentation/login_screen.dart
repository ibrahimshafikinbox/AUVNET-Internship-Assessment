import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:auvnet_flutter_internship/core/Helper/asset_helper.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_event.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_state.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/signup_screen.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/widgets/email_input_field.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/widgets/login_button.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/widgets/password_input_field.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            LoginSubmitted(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  void _onCreateAccountPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
    );
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
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
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
                  PasswordInputField(controller: _passwordController),
                  const SizedBox(height: AppDimens.spaceLarge),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        onPressed: _onLoginPressed,
                        isLoading: state is AuthLoading,
                        text: 'login',
                      );
                    },
                  ),
                  const SizedBox(height: AppDimens.spaceMedium),
                  TextButton(
                    onPressed: _onCreateAccountPressed,
                    child: const Text(
                      'Create an account',
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
