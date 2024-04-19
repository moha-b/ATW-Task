import 'package:atw/core/caching/caching.dart';
import 'package:atw/core/manager/manager.dart';
import 'package:atw/core/navigation/navigation.dart';
import 'package:atw/core/resources/resources.dart';
import 'package:atw/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(DependencyManager.get<UserRepository>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationHelper.navigatorKey,
        navigatorObservers: [NavigationHelper.routeObserver],
        scaffoldMessengerKey: NavigationHelper.scaffoldState,
        onGenerateRoute: NavigationHelper.generateRoute,
        theme: ThemeData(
            primaryColor: AppColors.PRIMARY,
            scaffoldBackgroundColor: AppColors.BACKGROUND),
        initialRoute: CachingHelper.instance!.readBoolean(CachingKey.IS_LOGIN)
            ? AppRoute.HOME
            : AppRoute.LOGIN,
      ),
    );
  }
}
