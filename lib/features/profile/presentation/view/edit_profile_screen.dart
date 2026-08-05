import 'package:exam_app_13/config/di/di.dart';
import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_cubit.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_intent.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_state.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_avatar.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_button.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const EditProfileScreen({
    super.key,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>(),
      child: _EditProfileForm(initial: widget),
    );
  }
}

class _EditProfileForm extends StatefulWidget {
  final EditProfileScreen initial;

  const _EditProfileForm({required this.initial});

  @override
  State<_EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<_EditProfileForm> {
  late final TextEditingController _usernameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProfileCubit>();
    final initial = widget.initial;
    cubit.onIntent(UpdateFieldIntent(ProfileField.username, initial.username));
    cubit.onIntent(UpdateFieldIntent(ProfileField.firstName, initial.firstName));
    cubit.onIntent(UpdateFieldIntent(ProfileField.lastName, initial.lastName));
    cubit.onIntent(UpdateFieldIntent(ProfileField.email, initial.email));
    cubit.onIntent(UpdateFieldIntent(ProfileField.phone, initial.phone));

    _usernameController = TextEditingController(text: initial.username);
    _firstNameController = TextEditingController(text: initial.firstName);
    _lastNameController = TextEditingController(text: initial.lastName);
    _emailController = TextEditingController(text: initial.email);
    _phoneController = TextEditingController(text: initial.phone);
    _passwordController = TextEditingController(text: '******');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isModified(ProfileState state) {
    final init = widget.initial;
    return state.username != init.username ||
        state.firstName != init.firstName ||
        state.lastName != init.lastName ||
        state.email != init.email ||
        state.phone != init.phone;
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();

    return Scaffold(
      backgroundColor: colors.background,
      appBar: _buildAppBar(colors),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: _onStateChanged,
        builder: _buildForm,
      ),
    );
  }

  AppBar _buildAppBar(AppColors colors) {
    return AppBar(
      backgroundColor: colors.background,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: colors.black, size: 18),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Edit profile',
        style: TextStyle(
          color: colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _onStateChanged(BuildContext context, ProfileState state) {
    if (state.status == ProfileStatus.error && state.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (state.status == ProfileStatus.success && Navigator.of(context).canPop()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
      Navigator.of(context).pop(true);
    }
  }

  Widget _buildForm(BuildContext context, ProfileState state) {
    final AppColors colors = LightColors();
    final cubit = context.read<ProfileCubit>();
    final modified = _isModified(state);
    final valid = state.isProfileFormValid;
    final loading = state.status == ProfileStatus.loading;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              ProfileAvatar(
                radius: 44,
                firstName: widget.initial.firstName,
                lastName: widget.initial.lastName,
              ),
              const SizedBox(height: 20),
              _buildUsernameField(cubit, state),
              _buildNameRow(cubit, state),
              _buildEmailField(cubit, state),
              _buildPasswordField(colors),
              _buildPhoneField(cubit, state),
              const SizedBox(height: 28),
              ProfileButton(
                label: 'Update',
                isLoading: loading,
                onPressed: modified && valid && !loading
                    ? () => cubit.onIntent(const SaveProfileIntent())
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField(ProfileCubit cubit, ProfileState state) {
    return ProfileTextField(
      controller: _usernameController,
      labelText: 'User name',
      errorText: state.username.isNotEmpty ? state.usernameError : null,
      onChanged: (val) =>
          cubit.onIntent(UpdateFieldIntent(ProfileField.username, val)),
    );
  }

  Widget _buildNameRow(ProfileCubit cubit, ProfileState state) {
    return Row(
      children: [
        Expanded(
          child: ProfileTextField(
            controller: _firstNameController,
            labelText: 'First name',
            errorText: state.firstName.isNotEmpty ? state.firstNameError : null,
            onChanged: (val) =>
                cubit.onIntent(UpdateFieldIntent(ProfileField.firstName, val)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ProfileTextField(
            controller: _lastNameController,
            labelText: 'Last name',
            errorText: state.lastName.isNotEmpty ? state.lastNameError : null,
            onChanged: (val) =>
                cubit.onIntent(UpdateFieldIntent(ProfileField.lastName, val)),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField(ProfileCubit cubit, ProfileState state) {
    return ProfileTextField(
      controller: _emailController,
      labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
      errorText: state.email.isNotEmpty ? state.emailError : null,
      onChanged: (val) =>
          cubit.onIntent(UpdateFieldIntent(ProfileField.email, val)),
    );
  }

  Widget _buildPasswordField(AppColors colors) {
    return ProfileTextField(
      controller: _passwordController,
      labelText: 'Password',
      obscureText: true,
      readOnly: true,
      suffixIcon: TextButton(
        onPressed: () {},
        child: Text(
          'Change',
          style: TextStyle(
            color: colors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField(ProfileCubit cubit, ProfileState state) {
    return ProfileTextField(
      controller: _phoneController,
      labelText: 'Phone number',
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
      ],
      errorText: state.phone.isNotEmpty ? state.phoneError : null,
      onChanged: (val) =>
          cubit.onIntent(UpdateFieldIntent(ProfileField.phone, val)),
    );
  }
}
