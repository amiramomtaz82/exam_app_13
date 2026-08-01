import 'package:equatable/equatable.dart';

import '../../../../../../config/base_state/resource.dart';
import '../../../../domain/entity/forget_password_entity.dart';

class ResetCodeState extends Equatable {
  final Resource<ForgetPasswordEntity> resetCodeResource;
  final bool isWrongCode;

  const ResetCodeState({
    required this.resetCodeResource,
    this.isWrongCode = false,
  });

  factory ResetCodeState.initial() {
    return ResetCodeState(
      resetCodeResource: Resource.initial(),
      isWrongCode: false,
    );
  }

  ResetCodeState copyWith({
    Resource<ForgetPasswordEntity>? resetCodeResource,
    bool? isWrongCode,
  }) {
    return ResetCodeState(
      resetCodeResource:
      resetCodeResource ?? this.resetCodeResource,
      isWrongCode: isWrongCode ?? this.isWrongCode,
    );
  }

  @override
  List<Object> get props => [
    resetCodeResource,
    isWrongCode,
  ];
}