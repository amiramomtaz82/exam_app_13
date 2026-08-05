import 'package:exam_app_13/config/di/di.dart';
import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_cubit.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_intent.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_state.dart';
import 'package:exam_app_13/features/profile/presentation/widget/password_tile.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>(),
      child: const ResetPasswordView(),
    );
  }
}

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        foregroundColor: colors.white,
        title: const Text('Change Password'),
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
              const SnackBar(content: Text('Password changed successfully')),
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
                    PasswordTile(
                      label: 'Current Password',
                      errorText: _visibleError(state.oldPassword, state.oldPasswordError),
                      onChanged: (value) => context
                          .read<ProfileCubit>()
                          .onIntent(UpdateFieldIntent(ProfileField.oldPassword, value)),
                    ),
                    PasswordTile(
                      label: 'New Password',
                      errorText: _visibleError(state.newPassword, state.newPasswordError),
                      onChanged: (value) => context
                          .read<ProfileCubit>()
                          .onIntent(UpdateFieldIntent(ProfileField.newPassword, value)),
                    ),
                    PasswordTile(
                      label: 'Confirm New Password',
                      errorText: _visibleError(state.rePassword, state.rePasswordError),
                      onChanged: (value) => context
                          .read<ProfileCubit>()
                          .onIntent(UpdateFieldIntent(ProfileField.rePassword, value)),
                    ),
                    const SizedBox(height: 24),
                    ProfileButton(
                      label: 'Update Password',
                      isLoading: state.status == ProfileStatus.loading,
                      onPressed: state.isPasswordFormValid && state.status != ProfileStatus.loading
                          ? () => context
                              .read<ProfileCubit>()
                              .onIntent(const ChangePasswordIntent())
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
