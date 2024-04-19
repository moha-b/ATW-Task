import 'package:atw/core/resources/resources.dart';
import 'package:atw/features/auth/cubit/auth_cubit.dart';
import 'package:atw/features/auth/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome"),
            SizedBox(height: 20.h),
            PrimaryButton(
              onTap: () => AuthCubit.instance.logOut(),
              text: "Logout",
              width: 150.w,
            )
          ],
        ),
      ),
    );
  }
}
