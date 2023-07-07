import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/data/model/user_model.dart';
import 'package:task/features/home/data/repo/home_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final HomeRepository repo;

  UserBloc(this.repo) : super(UserInitial()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());
      var result = await repo.fetchUserData();
      result.fold(
        (failure) => emit(UserFailure(failure.errorMessage)),
        (user) => emit(UserSuccess(user)),
      );
    });
  }
}
