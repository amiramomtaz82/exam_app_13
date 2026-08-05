import 'package:exam_app_13/config/di/di.dart';
import 'package:exam_app_13/core/app_routes/app_routes.dart';
import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/profile/domain/entities/Profile_entities.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_cubit.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_intent.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_state.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_avatar.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>()..onIntent(const GetProfileIntent()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        foregroundColor: colors.white,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.error && state.errorMessage != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case ProfileStatus.initial:
            case ProfileStatus.loading:
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            case ProfileStatus.error:
              return _ProfileErrorView(
                message: state.errorMessage ?? 'Something went wrong, please try again',
              );
            case ProfileStatus.success:
              final profile = state.profile;
              if (profile == null) return const SizedBox.shrink();
              return _ProfileContent(profile: profile);
          }
        },
      ),
    );
  }
}

class _ProfileErrorView extends StatelessWidget {
  final String message;

  const _ProfileErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 64, color: colors.error),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ProfileButton(
              label: 'Retry',
              onPressed: () =>
                  context.read<ProfileCubit>().onIntent(const GetProfileIntent()),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final ProfileEntities profile;

  const _ProfileContent({required this.profile});

  Future<void> _pushAndRefresh(
    BuildContext context,
    Route<dynamic> route,
  ) async {
    await Navigator.of(context).push(route);
    if (!context.mounted) return;
    context.read<ProfileCubit>().onIntent(const GetProfileIntent());
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  ProfileAvatar(
                    radius: 56,
                    firstName: profile.firstName,
                    lastName: profile.lastName,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${profile.firstName} ${profile.lastName}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${profile.username}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: colors.textSecondary),
                  ),
                  const SizedBox(height: 32),
                  _InfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: profile.email,
                  ),
                  _InfoTile(
                    icon: Icons.phone_outlined,
                    label: 'Phone',
                    value: profile.phone,
                  ),
                  const SizedBox(height: 32),
                  ProfileButton(
                    label: 'Edit Profile',
                    icon: const Icon(Icons.edit_outlined, size: 18),
                    onPressed: () => _pushAndRefresh(
                      context,
                      AppRoutes.editProfile(
                        username: profile.username,
                        firstName: profile.firstName,
                        lastName: profile.lastName,
                        email: profile.email,
                        phone: profile.phone,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ProfileButton(
                    label: 'Change Password',
                    icon: const Icon(Icons.lock_outline, size: 18),
                    onPressed: () => _pushAndRefresh(
                      context,
                      AppRoutes.resetPassword(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    return Card(
      color: colors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colors.blueSelected),
      ),
      child: ListTile(
        leading: Icon(icon, color: colors.primary),
        title: Text(
          label,
          style: TextStyle(fontSize: 13, color: colors.textSecondary),
        ),
        subtitle: Text(
          value,
          style: TextStyle(fontSize: 16, color: colors.textPrimary),
        ),
      ),
    );
  }
}
