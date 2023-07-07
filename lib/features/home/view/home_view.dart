import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/services/locator_service.dart';
import 'package:task/features/home/cubit/user_cubit/user_cubit.dart';
import 'package:task/features/home/view/widgets/my_albums_list_widget.dart';

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
                UserCubit(locator.get<HomeRepoImpl>())..fetchUser(),
            child: const HomeViewBody(),
          ),
        ),
      ),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              const SizedBox(height: 16),
              Text(
                state.user.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text.rich(
                TextSpan(
                  text: "${state.user.address.street}, ",
                  children: [
                    TextSpan(text: "${state.user.address.suite}, "),
                    TextSpan(text: "${state.user.address.city}\n"),
                    TextSpan(text: state.user.address.zipcode),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "My Albums",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              MyAlbumsList(userId: state.user.id),
            ],
          );
        } else if (state is UserFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
