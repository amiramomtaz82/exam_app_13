import 'package:equatable/equatable.dart';

import '../../../../../../config/base_state/resource.dart';
import '../../../../domain/entity/forget_password_entity.dart';

class ForgetPasswordState extends Equatable {
  final Resource<ForgetPasswordEntity> forgetPasswordResource;
  final Resource<ForgetPasswordEntity> resendCodeResource;

  ForgetPasswordState({
    required this.forgetPasswordResource,
    required this.resendCodeResource,
  });

  factory ForgetPasswordState.initial() {
    return ForgetPasswordState(
      forgetPasswordResource: Resource.initial(),
      resendCodeResource: Resource.initial(),
    );
  }

  ForgetPasswordState copyWith({
    Resource<ForgetPasswordEntity>? forgetPasswordResource,
    Resource<ForgetPasswordEntity>? resendCodeResource,
  }) {
    return ForgetPasswordState(
      forgetPasswordResource:
      forgetPasswordResource ?? this.forgetPasswordResource,
      resendCodeResource:
      resendCodeResource ?? this.resendCodeResource,
    );
  }

  List<Object> get props => [
    forgetPasswordResource,
    resendCodeResource,
  ];
}