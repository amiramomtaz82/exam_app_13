import 'package:exam_app_13/config/base_response/base_response.dart';
import 'package:exam_app_13/config/validation/validation.dart';
import 'package:exam_app_13/features/profile/domain/entities/Profile_entities.dart';
import 'package:exam_app_13/features/profile/domain/usecases/Edit_password_usecases.dart';
import 'package:exam_app_13/features/profile/domain/usecases/Edit_profile_usecases.dart';
import 'package:exam_app_13/features/profile/domain/usecases/Profile_info_usecases.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_intent.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._profileInfoUsecases,
    this._editProfileUsecases,
    this._editPasswordUsecases,
  ) : super(const ProfileState());

  final ProfileInfoUsecases _profileInfoUsecases;
  final EditProfileUsecases _editProfileUsecases;
  final EditPasswordUsecases _editPasswordUsecases;

  void onIntent(ProfileIntent intent) {
    switch (intent) {
      case GetProfileIntent():
        _getProfile();
      case UpdateFieldIntent(:final field, :final value):
        _updateField(field, value);
      case SaveProfileIntent():
        _saveProfile();
      case ChangePasswordIntent():
        _changePassword();
    }
  }

  Future<void> _getProfile() async {
    emit(state.copyWith(status: ProfileStatus.loading, errorMessage: null));
    final response = await _profileInfoUsecases();
    switch (response) {
      case SuccessResponse<ProfileEntities>(:final data):
        emit(state.copyWith(
          status: ProfileStatus.success,
          profile: data,
          username: data.username,
          firstName: data.firstName,
          lastName: data.lastName,
          email: data.email,
          phone: data.phone,
          usernameError: Validation.validateUsername(data.username),
          firstNameError: Validation.validateName(data.firstName),
          lastNameError: Validation.validateName(data.lastName),
          emailError: Validation.validateEmail(data.email),
          phoneError: Validation.validatePhoneNumber(data.phone),
        ));
      case ErrorResponse<ProfileEntities>(:final errMessage):
        emit(state.copyWith(status: ProfileStatus.error, errorMessage: errMessage));
    }
  }

  void _updateField(ProfileField field, String value) {
    switch (field) {
      case ProfileField.username:
        emit(state.copyWith(username: value, usernameError: Validation.validateUsername(value)));
      case ProfileField.firstName:
        emit(state.copyWith(firstName: value, firstNameError: Validation.validateName(value)));
      case ProfileField.lastName:
        emit(state.copyWith(lastName: value, lastNameError: Validation.validateName(value)));
      case ProfileField.email:
        emit(state.copyWith(email: value, emailError: Validation.validateEmail(value)));
      case ProfileField.phone:
        emit(state.copyWith(phone: value, phoneError: Validation.validatePhoneNumber(value)));
      case ProfileField.oldPassword:
        emit(state.copyWith(
          oldPassword: value,
          oldPasswordError: value.trim().isEmpty
              ? 'Current password is required'
              : null,
        ));
      case ProfileField.newPassword:
        emit(state.copyWith(newPassword: value, newPasswordError: Validation.validatePassword(value)));
      case ProfileField.rePassword:
        emit(state.copyWith(
          rePassword: value,
          rePasswordError: Validation.validateConfirmPassword(value, state.newPassword),
        ));
    }
  }

  Future<void> _saveProfile() async {
    if (!state.isProfileFormValid) return;
    emit(state.copyWith(status: ProfileStatus.loading, errorMessage: null));
    final response = await _editProfileUsecases(
      username: state.username,
      firstName: state.firstName,
      lastName: state.lastName,
      email: state.email,
      phone: state.phone,
    );
    switch (response) {
      case SuccessResponse<ProfileEntities>(:final data):
        emit(state.copyWith(status: ProfileStatus.success, profile: data));
      case ErrorResponse<ProfileEntities>(:final errMessage):
        emit(state.copyWith(status: ProfileStatus.error, errorMessage: errMessage));
    }
  }

  Future<void> _changePassword() async {
    if (!state.isPasswordFormValid) return;
    emit(state.copyWith(status: ProfileStatus.loading, errorMessage: null));
    final response = await _editPasswordUsecases(
      oldPassword: state.oldPassword,
      newPassword: state.newPassword,
      rePassword: state.rePassword,
    );
    switch (response) {
      case SuccessResponse<void>():
        emit(state.copyWith(
          status: ProfileStatus.success,
          oldPassword: '',
          newPassword: '',
          rePassword: '',
          oldPasswordError: null,
          newPasswordError: null,
          rePasswordError: null,
        ));
      case ErrorResponse<void>(:final errMessage):
        emit(state.copyWith(status: ProfileStatus.error, errorMessage: errMessage));
    }
  }
}
