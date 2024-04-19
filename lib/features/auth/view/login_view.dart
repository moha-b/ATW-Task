import 'package:atw/core/helper/validation_helper.dart';
import 'package:atw/core/navigation/navigation.dart';
import 'package:atw/core/resources/resources.dart';
import 'package:atw/features/auth/cubit/auth_cubit.dart';
import 'package:atw/features/auth/view/widgets/custom_text_field.dart';
import 'package:atw/features/auth/view/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emilController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: 16.allInsets,
              child: Form(
                key: loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Text(
                      "Welcome on board!",
                      style: AppText.h1(),
                    ),
                    SizedBox(height: 10.h),
                    const Text("Sign in to your account"),
                    SizedBox(height: 40.h),
                    CustomTextField(
                      title: "Email",
                      hint: "Enter your Email",
                      validator: ValidationHelper.instance.validateEmail,
                      controller: _emilController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      title: "Password",
                      hint: "Enter your Password",
                      validator: ValidationHelper.instance.validatePassword,
                      controller: _passwordController,
                      icon: AuthCubit.instance.visibility
                          ? IconsaxPlusLinear.eye
                          : IconsaxPlusLinear.eye_slash,
                      obscure: AuthCubit.instance.visibility,
                      obscureClicked: () =>
                          AuthCubit.instance.changePasswordVisibility(),
                    ),
                    SizedBox(height: 50.h),
                    AuthButton(
                      state: state,
                      onTap: () {
                        if (loginKey.currentState!.validate()) {
                          AuthCubit.instance.login(
                              email: _emilController.text,
                              password: _passwordController.text);
                        }
                      },
                    ),
                    TextButton(
                      onPressed: () =>
                          NavigationHelper.navigateTo(AppRoute.REGISTER),
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emilController.dispose();
    _passwordController.dispose();
    loginKey.currentState?.dispose();
  }
}
