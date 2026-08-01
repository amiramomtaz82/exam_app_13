import 'package:equatable/equatable.dart';

import '../../../../../../config/base_state/resource.dart';
import '../../../../domain/entity/forget_password_entity.dart';


class ResetCodeState extends Equatable {
  final Resource<ForgetPasswordEntity> resetCodeResource;

  const ResetCodeState({
    required this.resetCodeResource,
  });

  factory ResetCodeState.initial() {
    return ResetCodeState(
      resetCodeResource: Resource.initial(),
    );
  }

  ResetCodeState copyWith({
    Resource<ForgetPasswordEntity>? resetCodeResource,
  }) {
    return ResetCodeState(
      resetCodeResource:
      resetCodeResource ?? this.resetCodeResource,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [resetCodeResource];
}