import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/validation/validation.dart';
import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../../core/widget/app_circular_indicator.dart';
import '../../../../../../core/widget/app_text_filed.dart';
import '../view_model/forget_password_cubit.dart';
import '../view_model/forget_password_event.dart';
import '../view_model/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final AppColors colors = LightColors();
  bool hasError = false;

  TextEditingController emailController = TextEditingController();

  void validateEmailField(String value) {
    setState(() {
      if (value
          .trim()
          .isEmpty) {
        hasError = false;
      } else {
        hasError = Validation.validateEmail(value) != null;
      }
    });
  }


  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),

      body: buildBody(context),
    );
  }

  Form buildBody(BuildContext context) {
    return Form(
      key: formKey,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          //==============================================
          buildAppTextFormField(),
          //=====================================
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(16.0),

            //-----------------------------------------------
            child: buildButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          AppStrings.forgetPassword,
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 300,
          child: Text(
            AppStrings.associate,
            style: Theme
                .of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  AppTextFormField buildAppTextFormField() {
    return AppTextFormField(

      labelText: AppStrings.email,
      hintText: AppStrings.enterYourEmail,
      controller: emailController,
      onChanged: validateEmailField,
      validator: Validation.validateEmail,
      hasError: hasError,
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

  BlocConsumer<ForgetPasswordCubit, ForgetPasswordState> buildButton() {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: handleForgetPasswordState,
      //--------------------------------------------------------------
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: hasError
                ? colors.darkGrey
                : colors.primary,
          ),
          onPressed: state.forgetPasswordResource.isLoading
              ? null
              : () => submitButton(context),
          child: state.forgetPasswordResource.isLoading
              ? const AppCircularIndicator()
              : Text(AppStrings.continu),
        );
      },
    );
  }

  void submitButton(BuildContext context) {
    {
      final isValid = formKey.currentState!.validate();

      setState(() {
        hasError = !isValid;
      });

      if (isValid) {
        context.read<ForgetPasswordCubit>().
        doEvents(ForgetPasswordEvent
          (emailController.text.trim()));
      }
    }
  }

  void handleForgetPasswordState(BuildContext context,
      ForgetPasswordState state,) {
    if (state.forgetPasswordResource.isError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.forgetPasswordResource.errorMessage ??
                AppStrings.somethingWentWrong,
          ),
        ),
      );
    } else if (state.forgetPasswordResource.isSuccess) {
      Navigator.push(
        context,
        AppRoutes.emailVerification(
          emailController.text,
          context.read<ForgetPasswordCubit>(),
        ),
      );
    }
  }
}