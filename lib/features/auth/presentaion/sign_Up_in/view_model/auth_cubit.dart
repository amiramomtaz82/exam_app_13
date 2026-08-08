import 'package:exam_app/core/base/base_state.dart';
import 'package:exam_app/core/base/result.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/usecases/signin_use_case.dart';
import 'package:exam_app/feature/auth/login&&regestier/domain/usecases/signup_use_case.dart';
import 'package:exam_app/feature/auth/login&&regestier/presentaion/view_model/auth_intent.dart';
import 'package:exam_app/feature/auth/login&&regestier/presentaion/view_model/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SigninUseCase _signinUseCase;
  final SignupUseCase _signupUseCase;

  AuthCubit(this._signinUseCase, this._signupUseCase)
      : super(const InitialState());

  void doIntent(AuthIntent intent) {
    switch (intent) {
      case SigninIntent():
        _signin(intent);
      case SignupIntent():
        _signup(intent);
    }
  }

  Future<void> _signin(SigninIntent intent) async {
    emit(const LoadingState());

    final result = await _signinUseCase(
      email: intent.email,
      password: intent.password,
    );

    switch (result) {
      case Success():
        emit(SuccessState(result.data));
      case ServerFailure():
        emit(ErrorState(result.message));
    }
  }

  Future<void> _signup(SignupIntent intent) async {
    emit(const LoadingState());

    final result = await _signupUseCase(
      username: intent.username,
      firstName: intent.firstName,
      lastName: intent.lastName,
      email: intent.email,
      password: intent.password,
      rePassword: intent.rePassword,
      phone: intent.phone,
    );

    switch (result) {
      case Success():
        emit(SuccessState(result.data));
      case ServerFailure():
        emit(ErrorState(result.message));
    }
  }
}
