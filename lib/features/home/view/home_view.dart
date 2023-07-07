import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/services/locator_service.dart';
import 'package:task/features/home/bloc/user_bloc/user_bloc.dart';
import 'package:task/features/home/view/widgets/home_view_body.dart';

import '../data/source/home_repo_impl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocProvider(
            create: (context) =>
                UserBloc(locator.get<HomeRepoImpl>())..add(GetUser()),
            child: const HomeViewBody(),
          ),
        ),
      ),
    );
  }
}
