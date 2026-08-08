import 'package:exam_app/config/di.dart';
import 'package:exam_app/core/base/base_state.dart';
import 'package:exam_app/feature/auth/login&&regestier/presentaion/view_model/auth_cubit.dart';
import 'package:exam_app/feature/auth/login&&regestier/presentaion/view_model/auth_intent.dart';
import 'package:exam_app/feature/auth/login&&regestier/presentaion/view_model/auth_state.dart';
import 'package:exam_app/feature/auth/login&&regestier/presentaion/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _usernameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  bool get _isFormValid =>
      _usernameController.text.isNotEmpty &&
      _firstNameController.text.isNotEmpty &&
      _lastNameController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty &&
      _phoneController.text.isNotEmpty &&
      _usernameError == null &&
      _emailError == null &&
      _passwordError == null &&
      _confirmPasswordError == null;

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _validateUsername(String value) {
    setState(() {
      if (value.isEmpty) {
        _usernameError = null;
      } else if (value.length < 3) {
        _usernameError = 'This user name is not valid';
      } else {
        _usernameError = null;
      }
    });
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = null;
      } else if (!RegExp(
        r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
      ).hasMatch(value)) {
        _emailError = 'This Email is not valid';
      } else {
        _emailError = null;
      }
    });
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordError = null;
      } else if (value.length < 6) {
        _passwordError = 'Password is too short';
      } else {
        _passwordError = null;
      }
      _validateConfirmPasswordSilent();
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      _validateConfirmPasswordSilent();
    });
  }

  void _validateConfirmPasswordSilent() {
    final confirm = _confirmPasswordController.text;
    if (confirm.isEmpty) {
      _confirmPasswordError = null;
    } else if (confirm != _passwordController.text) {
      _confirmPasswordError = 'Password not matched';
    } else {
      _confirmPasswordError = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF0F0F0F)),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: const Text(
            'Sign up',
            style: TextStyle(
              color: Color(0xFF0F0F0F),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state) {
              case SuccessState():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Signup successful! ${state.data.message}'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).pop();
              case ErrorState():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              default:
                break;
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextFormField(
                    labelText: 'User name',
                    hintText: 'Enter your user name',
                    controller: _usernameController,
                    errorText: _usernameError,
                    onChanged: _validateUsername,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          labelText: 'First name',
                          hintText: 'Enter first name',
                          controller: _firstNameController,
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppTextFormField(
                          labelText: 'Last name',
                          hintText: 'Enter last name',
                          controller: _lastNameController,
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppTextFormField(
                    labelText: 'Email',
                    hintText: 'Enter you email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: _emailError,
                    onChanged: _validateEmail,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          labelText: 'Password',
                          hintText: 'Enter password',
                          controller: _passwordController,
                          obscureText: true,
                          errorText: _passwordError,
                          onChanged: _validatePassword,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppTextFormField(
                          labelText: 'Confirm password',
                          hintText: 'Confirm password',
                          controller: _confirmPasswordController,
                          obscureText: true,
                          errorText: _confirmPasswordError,
                          onChanged: _validateConfirmPassword,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppTextFormField(
                    labelText: 'Phone number',
                    hintText: 'Enter phone number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _isFormValid && state is! LoadingState
                          ? () {
                              context.read<AuthCubit>().doIntent(
                                    SignupIntent(
                                      username:
                                          _usernameController.text.trim(),
                                      firstName:
                                          _firstNameController.text.trim(),
                                      lastName:
                                          _lastNameController.text.trim(),
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                      rePassword:
                                          _confirmPasswordController.text,
                                      phone: _phoneController.text.trim(),
                                    ),
                                  );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF114DBE),
                        disabledBackgroundColor: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: state is LoadingState
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Text(
                              'Signup',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF0F0F0F),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF114DBE),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
