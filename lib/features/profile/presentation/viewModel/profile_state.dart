import 'package:exam_app_13/features/profile/domain/entities/profile_entities.dart';
import 'package:flutter/foundation.dart';

class _Unset {
  const _Unset();
}

const Object _unset = _Unset();

enum ProfileStatus { initial, loading, success, error }

@immutable
class ProfileState {
  final ProfileStatus status;
  final ProfileEntities? profile;
  final String? errorMessage;

  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String oldPassword;
  final String newPassword;
  final String rePassword;

  final String? usernameError;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? phoneError;
  final String? oldPasswordError;
  final String? newPasswordError;
  final String? rePasswordError;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.profile,
    this.errorMessage,
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.oldPassword = '',
    this.newPassword = '',
    this.rePassword = '',
    this.usernameError,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.phoneError,
    this.oldPasswordError,
    this.newPasswordError,
    this.rePasswordError,
  });

  bool get isProfileFormValid =>
      usernameError == null &&
      firstNameError == null &&
      lastNameError == null &&
      emailError == null &&
      phoneError == null;

  bool get isPasswordFormValid =>
      oldPasswordError == null &&
      newPasswordError == null &&
      rePasswordError == null;

  ProfileState copyWith({
    ProfileStatus? status,
    ProfileEntities? profile,
    Object? errorMessage = _unset,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? oldPassword,
    String? newPassword,
    String? rePassword,
    Object? usernameError = _unset,
    Object? firstNameError = _unset,
    Object? lastNameError = _unset,
    Object? emailError = _unset,
    Object? phoneError = _unset,
    Object? oldPasswordError = _unset,
    Object? newPasswordError = _unset,
    Object? rePasswordError = _unset,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      errorMessage: identical(errorMessage, _unset)
          ? this.errorMessage
          : errorMessage as String?,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      rePassword: rePassword ?? this.rePassword,
      usernameError: identical(usernameError, _unset)
          ? this.usernameError
          : usernameError as String?,
      firstNameError: identical(firstNameError, _unset)
          ? this.firstNameError
          : firstNameError as String?,
      lastNameError: identical(lastNameError, _unset)
          ? this.lastNameError
          : lastNameError as String?,
      emailError: identical(emailError, _unset)
          ? this.emailError
          : emailError as String?,
      phoneError: identical(phoneError, _unset)
          ? this.phoneError
          : phoneError as String?,
      oldPasswordError: identical(oldPasswordError, _unset)
          ? this.oldPasswordError
          : oldPasswordError as String?,
      newPasswordError: identical(newPasswordError, _unset)
          ? this.newPasswordError
          : newPasswordError as String?,
      rePasswordError: identical(rePasswordError, _unset)
          ? this.rePasswordError
          : rePasswordError as String?,
    );
  }
}
