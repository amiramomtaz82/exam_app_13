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

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colors.black, size: 18),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Reset password',
          style: TextStyle(
            color: colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.error && state.errorMessage != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          } else if (state.status == ProfileStatus.success && Navigator.of(context).canPop()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password reset successfully')),
            );
            Navigator.of(context).pop(true);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          final bool isFilled = state.oldPassword.isNotEmpty &&
              state.newPassword.isNotEmpty &&
              state.rePassword.isNotEmpty;
          final bool isValid = state.isPasswordFormValid && isFilled;
          final bool isLoading = state.status == ProfileStatus.loading;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PasswordTile(
                      controller: _oldPasswordController,
                      label: 'Current password',
                      errorText: state.oldPassword.isNotEmpty ? state.oldPasswordError : null,
                      onChanged: (val) =>
                          cubit.onIntent(UpdateFieldIntent(ProfileField.oldPassword, val)),
                    ),
                    const SizedBox(height: 8),
                    PasswordTile(
                      controller: _newPasswordController,
                      label: 'New password',
                      errorText: state.newPassword.isNotEmpty ? state.newPasswordError : null,
                      onChanged: (val) =>
                          cubit.onIntent(UpdateFieldIntent(ProfileField.newPassword, val)),
                    ),
                    const SizedBox(height: 8),
                    PasswordTile(
                      controller: _rePasswordController,
                      label: 'Confirm password',
                      errorText: state.rePassword.isNotEmpty ? state.rePasswordError : null,
                      onChanged: (val) =>
                          cubit.onIntent(UpdateFieldIntent(ProfileField.rePassword, val)),
                    ),
                    const SizedBox(height: 36),
                    ProfileButton(
                      label: 'Update',
                      isLoading: isLoading,
                      onPressed: isValid && !isLoading
                          ? () => cubit.onIntent(const ChangePasswordIntent())
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
}
