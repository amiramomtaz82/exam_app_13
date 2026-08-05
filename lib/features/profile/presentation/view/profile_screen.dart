import 'package:exam_app_13/config/di/di.dart';
import 'package:exam_app_13/core/app_routes/app_routes.dart';
import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:exam_app_13/features/profile/domain/entities/Profile_entities.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_cubit.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_intent.dart';
import 'package:exam_app_13/features/profile/presentation/viewModel/profile_state.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_avatar.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_button.dart';
import 'package:exam_app_13/features/profile/presentation/widget/profile_text_field.dart';
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

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
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
          } else if (state.status == ProfileStatus.success && state.errorMessage == null) {
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case ProfileStatus.initial:
            case ProfileStatus.loading:
              if (state.profile == null) {
                return Center(
                  child: CircularProgressIndicator(color: colors.primary),
                );
              }
              return _ProfileFormContent(profile: state.profile!, state: state);
            case ProfileStatus.error:
              if (state.profile != null) {
                return _ProfileFormContent(profile: state.profile!, state: state);
              }
              return _ProfileErrorView(
                message: state.errorMessage ?? 'Something went wrong, please try again',
              );
            case ProfileStatus.success:
              final profile = state.profile;
              if (profile == null) return const SizedBox.shrink();
              return _ProfileFormContent(profile: profile, state: state);
          }
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: colors.lightBlue,
          indicatorColor: colors.blueSelected,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: colors.primary,
              );
            }
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: colors.darkGrey,
            );
          }),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: colors.primary, size: 24);
            }
            return IconThemeData(color: colors.darkGrey, size: 24);
          }),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.assignment_outlined),
              selectedIcon: Icon(Icons.assignment),
              label: 'Result',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
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

class _ProfileFormContent extends StatefulWidget {
  final ProfileEntities profile;
  final ProfileState state;

  const _ProfileFormContent({
    required this.profile,
    required this.state,
  });

  @override
  State<_ProfileFormContent> createState() => _ProfileFormContentState();
}

class _ProfileFormContentState extends State<_ProfileFormContent> {
  late final TextEditingController _usernameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _usernameController = TextEditingController(text: p.username);
    _firstNameController = TextEditingController(text: p.firstName);
    _lastNameController = TextEditingController(text: p.lastName);
    _emailController = TextEditingController(text: p.email);
    _phoneController = TextEditingController(text: p.phone);
    _passwordController = TextEditingController(text: '******');
  }

  @override
  void didUpdateWidget(covariant _ProfileFormContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile != widget.profile) {
      final p = widget.profile;
      _usernameController.text = p.username;
      _firstNameController.text = p.firstName;
      _lastNameController.text = p.lastName;
      _emailController.text = p.email;
      _phoneController.text = p.phone;
    }
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

  bool _isFormModified() {
    final p = widget.profile;
    final s = widget.state;
    return s.username != p.username ||
        s.firstName != p.firstName ||
        s.lastName != p.lastName ||
        s.email != p.email ||
        s.phone != p.phone;
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    final cubit = context.read<ProfileCubit>();
    final isModified = _isFormModified();
    final isValid = widget.state.isProfileFormValid;
    final isLoading = widget.state.status == ProfileStatus.loading;

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
                firstName: widget.profile.firstName,
                lastName: widget.profile.lastName,
              ),
              const SizedBox(height: 20),
              ProfileTextField(
                controller: _usernameController,
                labelText: 'User name',
                errorText: widget.state.username.isNotEmpty ? widget.state.usernameError : null,
                onChanged: (val) => cubit.onIntent(UpdateFieldIntent(ProfileField.username, val)),
              ),
              Row(
                children: [
                  Expanded(
                    child: ProfileTextField(
                      controller: _firstNameController,
                      labelText: 'First name',
                      errorText: widget.state.firstName.isNotEmpty ? widget.state.firstNameError : null,
                      onChanged: (val) => cubit.onIntent(UpdateFieldIntent(ProfileField.firstName, val)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ProfileTextField(
                      controller: _lastNameController,
                      labelText: 'Last name',
                      errorText: widget.state.lastName.isNotEmpty ? widget.state.lastNameError : null,
                      onChanged: (val) => cubit.onIntent(UpdateFieldIntent(ProfileField.lastName, val)),
                    ),
                  ),
                ],
              ),
              ProfileTextField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                errorText: widget.state.email.isNotEmpty ? widget.state.emailError : null,
                onChanged: (val) => cubit.onIntent(UpdateFieldIntent(ProfileField.email, val)),
              ),
              ProfileTextField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                readOnly: true,
                suffixIcon: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(AppRoutes.resetPassword());
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              ProfileTextField(
                controller: _phoneController,
                labelText: 'Phone number',
                keyboardType: TextInputType.phone,
                errorText: widget.state.phone.isNotEmpty ? widget.state.phoneError : null,
                onChanged: (val) => cubit.onIntent(UpdateFieldIntent(ProfileField.phone, val)),
              ),
              const SizedBox(height: 28),
              ProfileButton(
                label: 'Update',
                isLoading: isLoading,
                onPressed: isModified && isValid && !isLoading
                    ? () => cubit.onIntent(const SaveProfileIntent())
                    : null,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
