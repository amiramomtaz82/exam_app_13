import 'package:exam_app_13/config/di/di.dart';
import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_cubit.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_intent.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_state.dart';
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
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        foregroundColor: colors.white,
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
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
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ProfileTextField(
                      controller: _usernameController,
                      labelText: 'Username',
                      errorText: _visibleError(state.username, state.usernameError),
                      onChanged: (value) => context
                          .read<ProfileCubit>()
                          .onIntent(UpdateFieldIntent(ProfileField.username, value)),
                    ),
                    ProfileTextField(
                      controller: _firstNameController,
                      labelText: 'First Name',
                      errorText: _visibleError(state.firstName, state.firstNameError),
                      onChanged: (value) => context
                          .read<ProfileCubit>()
                          .onIntent(UpdateFieldIntent(ProfileField.firstName, value)),
                    ),
                    ProfileTextField(
                      controller: _lastNameController,
                      labelText: 'Last Name',
                      errorText: _visibleError(state.lastName, state.lastNameError),
                      onChanged: (value) => context
                          .read<ProfileCubit>()
                          .onIntent(UpdateFieldIntent(ProfileField.lastName, value)),
                    ),
                    ProfileTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      errorText: _visibleError(state.email, state.emailError),
                      onChanged: (value) => context
                          .read<ProfileCubit>()
                          .onIntent(UpdateFieldIntent(ProfileField.email, value)),
                    ),
                    ProfileTextField(
                      controller: _phoneController,
                      labelText: 'Phone',
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      errorText: _visibleError(state.phone, state.phoneError),
                      onChanged: (value) => context
                          .read<ProfileCubit>()
                          .onIntent(UpdateFieldIntent(ProfileField.phone, value)),
                    ),
                    const SizedBox(height: 24),
                    ProfileButton(
                      label: 'Save Changes',
                      isLoading: state.status == ProfileStatus.loading,
                      onPressed: state.isProfileFormValid && state.status != ProfileStatus.loading
                          ? () => context
                              .read<ProfileCubit>()
                              .onIntent(const SaveProfileIntent())
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? _visibleError(String value, String? error) =>
      value.isNotEmpty ? error : null;
}
