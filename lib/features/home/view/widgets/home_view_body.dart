import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/enums.dart';
import 'package:task/core/utils/styles.dart';
import 'package:task/features/home/bloc/home_bloc.dart';

import 'my_albums_list_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.state == DataState.Success) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile",
                style: AppStyles.headerStyle,
              ),
              const SizedBox(height: 16),
              Text(
                state.user.name!,
                style: AppStyles.titleStyle,
              ),
              buildAddressText(state),
              const SizedBox(height: 16),
              const Text(
                "My Albums",
                style: AppStyles.titleStyle,
              ),
              MyAlbumsList(userId: state.user.id!),
            ],
          );
        } else if (state.state == DataState.Failure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Text buildAddressText(HomeState state) {
    return Text.rich(
      TextSpan(
        text: "${state.user.address?.street}, ",
        children: [
          TextSpan(text: "${state.user.address?.suite}, "),
          TextSpan(text: "${state.user.address?.city}\n"),
          TextSpan(text: state.user.address?.zipcode),
        ],
      ),
    );
  }
}
