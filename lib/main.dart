import 'package:flutter/material.dart';
import 'package:task/core/utils/size.dart';
import 'package:task/features/home/view/home_view.dart';

import 'core/services/locator_service.dart';

void main() {
  setupServiceLocator();
  runApp(const ATWTask());
}

class ATWTask extends StatelessWidget {
  const ATWTask({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
