import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/size.dart';
import 'package:task/features/home/view/home_view.dart';

import 'core/services/locator_service.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/home/data/source/home_repo_impl.dart';

void main() {
  setupServiceLocator();
  runApp(const ATWTask());
}

class ATWTask extends StatelessWidget {
  const ATWTask({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) =>
          HomeBloc(locator.get<HomeRepoImpl>())..add(GetUser()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
