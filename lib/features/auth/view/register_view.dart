import 'package:atw/core/resources/resources.dart';
import 'package:atw/features/auth/view/widgets/custom_text_field.dart';
import 'package:atw/features/auth/view/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../core/helper/validation_helper.dart';
import '../../../core/navigation/navigation.dart';
import '../cubit/auth_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emilController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: 16.allInsets,
              child: Form(
                key: signUpKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Text(
                      "Welcome on board!",
                      style: AppText.h1(),
                    ),
                    SizedBox(height: 10.h),
                    const Text("Sign up to your account"),
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
                      isLogin: false,
                      onTap: () {
                        if (signUpKey.currentState!.validate()) {
                          AuthCubit.instance.signUp(
                              email: _emilController.text,
                              password: _passwordController.text);
                        }
                      },
                    ),
                    TextButton(
                      onPressed: () =>
                          NavigationHelper.navigateTo(AppRoute.REGISTER),
                      child: const Text("Login"),
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
    signUpKey.currentState?.dispose();
  }
}
