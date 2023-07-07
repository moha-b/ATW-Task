import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/features/home/data/source/home_repo_impl.dart';

import 'api_service.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ApiService>(ApiService(Dio()));
  locator
      .registerSingleton<HomeRepoImpl>(HomeRepoImpl(locator.get<ApiService>()));
}
