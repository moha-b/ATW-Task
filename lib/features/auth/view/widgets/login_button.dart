import 'package:atw/features/auth/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/resources/resources.dart';
import '../../cubit/auth_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onTap,
    required this.state,
    this.isLogin = true,
  });
  final bool isLogin;
  final void Function() onTap;
  final AuthState state;
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onTap: onTap,
      height: 50.h,
      borderRadius: 10.r,
      fontSize: 20.sp,
      widget: state is LoadingState
          ? LoadingAnimationWidget.waveDots(color: AppColors.WHITE, size: 60)
          : Text(isLogin ? "Login" : "Sign up", style: AppText.h3()),
    );
  }
}
