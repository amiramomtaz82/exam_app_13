import 'package:flutter/foundation.dart';

enum ProfileField {
  username,
  firstName,
  lastName,
  email,
  phone,
  oldPassword,
  newPassword,
  rePassword,
}

@immutable
sealed class ProfileIntent {
  const ProfileIntent();
}

class GetProfileIntent extends ProfileIntent {
  const GetProfileIntent();
}

class UpdateFieldIntent extends ProfileIntent {
  final ProfileField field;
  final String value;

  const UpdateFieldIntent(this.field, this.value);
}

class SaveProfileIntent extends ProfileIntent {
  const SaveProfileIntent();
}

class ChangePasswordIntent extends ProfileIntent {
  const ChangePasswordIntent();
}
