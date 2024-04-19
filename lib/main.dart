import 'package:atw/core/caching/caching.dart';
import 'package:atw/core/manager/manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyManager.init();
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    CachingHelper.init(),
  ]);
  runApp(const App());
}
