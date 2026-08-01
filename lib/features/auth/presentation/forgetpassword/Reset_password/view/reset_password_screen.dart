import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/validation/validation.dart';
import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../../core/widget/app_circular_indicator.dart';
import '../../../../../../core/widget/app_text_filed.dart';
import '../view_model/reset_password_cubit.dart';
import '../view_model/reset_password_event.dart';
import '../view_model/reset_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  String email;

  ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool hasError1 = false;
  bool hasError2 = false;

  // void validatePasswordField(String value) {
  //   setState(() {
  //     if (value.trim().isEmpty) {
  //       hasError1 = false;
  //     } else {
  //       hasError1 = Validation.validatePassword(value) != null;
  //     }
  //   });
  // }

  // void validateConfirmPasswordField(String value) {
  //   setState(() {
  //     if (value.trim().isEmpty && value.trim() != passwordController.text) {
  //       hasError2 = false;
  //     } else {
  //       hasError2 =
  //           Validation.validateConfirmPassword(
  //             value,
  //             passwordController.text,
  //           ) !=
  //               null;
  //     }
  //   });
  // }




  @override
  Widget build(BuildContext context) {
    AppColors colors = LightColors();
    return Scaffold(
      appBar: buildAppBar(context),

      body: Form(
        key: formKey,

        child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [_buildHeader(),

                  SizedBox(height: 20),
                  //==============================================
                  buildPasswordFiled(),
                  SizedBox(height: 20),
                  //===================================================
                  buildConfirmPasswordField(),
                  //==========================================
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocConsumer<ResetPasswordCubit, RestPasswordState>(
                      listener:handleResetPasswordState
                      ,
                      builder: (context, state) {
                        return ElevatedButton(


                          onPressed:hasError2?null:
                          _continueSubmit
                          ,child: state.resetPasswordResource.isLoading
                            ? const AppCircularIndicator()
                            : Text(AppStrings.continu),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _continueSubmit(){


    context.read<ResetPasswordCubit>().doEvent(
      ResetPasswordEvent(
        widget.email,
        passwordController.text.trim(),
      ),
    );

  }
  void handleResetPasswordState(BuildContext context, RestPasswordState state){


    if (state.resetPasswordResource.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.thePasswordChanged),
        ),
      );
      Navigator.push(context, AppRoutes.login);
    }
    if (state.resetPasswordResource.isError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${state.resetPasswordResource.errorMessage ?? AppStrings.somethingWentWrong}",
          ),
        ),
      );
    }

  }

  Widget buildConfirmPasswordField() {
    return AppTextFormField(
      labelText: AppStrings.confirmPassword,
      hintText: AppStrings.confirmPassword,
      controller: confirmPasswordController,
      onChanged:  (value) {
        setState(() {
          if (value.trim().isEmpty) {
            hasError2 = false;
          } else {
            hasError2 =
                      Validation.validateConfirmPassword(
                        value,
                        passwordController.text,
                      ) !=
                          null;
                }

        });
      },
      validator: (value) {
        return Validation.validateConfirmPassword(
          value,
          passwordController.text.trim(),
        );
      },
      hasError: hasError2,
    );
  }

  Widget buildPasswordFiled() {
    return AppTextFormField(
      labelText: AppStrings.password,
      hintText: AppStrings.enterYourPassword,
      controller: passwordController,
      onChanged:  (value) {
        setState(() {
          if (value.trim().isEmpty) {
            hasError1 = false;
          } else {
            hasError1 = Validation.validatePassword(value) != null;
          }
        });
      },
      validator: Validation.validatePassword,
      hasError: hasError1,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.password),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
    );
  }

  Widget _buildHeader(){
    return Column(children: [
      SizedBox(height: 10),
      Center(
        child: Text(
          AppStrings.rest,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      SizedBox(height: 10),
      Center(
        child: Container(
          width: 300,

          child: Center(
            child: Text(
              AppStrings.passwordMust,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ],);
  }
}
