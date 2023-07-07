import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/data/model/user_model.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.repo) : super(UserInitial());

  final HomeRepository repo;
  Future<void> fetchUser() async {
    emit(UserLoading());
    var result = await repo.fetchUserData();
    result.fold(
        (failure) => emit(UserFailure()), (user) => emit(UserSuccess(user)));
  }
}
