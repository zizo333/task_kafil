import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/data/models/user_type_model.dart';
import 'package:task/data/repos/app_repo.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._appRepo) : super(const SplashState.initial());

  final AppRepo _appRepo;

  Future<void> fetchUserTypes() async {
    emit(const SplashState.loading());
    final result = await _appRepo.fetchUserTypes();
    result.when(
      success: (userTypes) {
        emit(SplashState.loaded(userTypes));
      },
      failure: (failure) {
        emit(SplashState.error(failure.message));
      },
    );
  }
}
