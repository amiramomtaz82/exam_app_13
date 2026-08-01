import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app_routes/app_routes.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/constants/app_strings/app_strings.dart';
import '../../forget_password/view_model/forget_password_cubit.dart';
import '../../forget_password/view_model/forget_password_event.dart';
import '../../forget_password/view_model/forget_password_state.dart';
import '../view_model/reset_code_cubit.dart';
import '../view_model/reset_code_event.dart';
import '../view_model/reset_code_state.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;

  EmailVerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController codeController = TextEditingController();

  bool isLoading = false;

  AppColors colors = LightColors();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 74,
      height: 68,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: colors.bluePin,
        border: Border.all(color: colors.lightBlue),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 7),
    );

    final PinTheme errorPinTheme = defaultPinTheme.copyDecorationWith(
      color: colors.white,
      border: Border.all(color: colors.error),
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      appBar: buildAppBar(context),

      body: MultiBlocListener(
        listeners: [
          //---------------------------
          BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
            listener: handleResendCodeState,
          ),

          //---------------------------------
          BlocListener<ResetCodeCubit, ResetCodeState>(
            listenWhen: (previous, current) =>
            previous.resetCodeResource != current.resetCodeResource,
            listener: handleResetCodeState,
          ),
        ],

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(),
            //============================================
          BlocBuilder<ResetCodeCubit,ResetCodeState>(
              buildWhen: (previous, current) =>
              previous.isWrongCode != current.isWrongCode,
              builder: (context,state) {

                return Pinput(
                  controller: codeController,
                  length: 4,
                  keyboardType: TextInputType.number,
                  onChanged: (_) {
                    context.read<ResetCodeCubit>().doEvents(
                      ClearWrongCodeEvent(),
                    );
                  },

                  onCompleted: (pin) async {
                    await context.read<ResetCodeCubit>().doEvents(
                      ResetCodeEvent(pin),
                    );
                  },
                  defaultPinTheme: defaultPinTheme,
                  errorPinTheme: errorPinTheme,
                  forceErrorState:  state.isWrongCode,
                );
              }
          ),

            BlocBuilder<ResetCodeCubit, ResetCodeState>(
              buildWhen: (previous, current) =>
              previous.isWrongCode != current.isWrongCode,
              builder: (context, state) {
                if (!state.isWrongCode) {
                  return const SizedBox.shrink();
                }

                return buildInvalidCode();
              },
            ),


            SizedBox(height: 20), buildResendCode(),

          ],
        ),
      ),
    );
  }

  Widget buildResendCode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.didntReciveCode,
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,
        ),
        InkWell(
          onTap: () {
            context.read<ForgetPasswordCubit>().doEvents(
              ForgetPasswordEvent(widget.email),
            );
          },
          child: Text(
            AppStrings.resend,
            style: Theme
                .of(
              context,
            )
                .textTheme
                .bodyMedium
                ?.copyWith(color: colors.primary),
          ),
        ),
      ],
    );
  }

  Widget buildInvalidCode() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 24),
      child: Row(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(
              Icons.error_outline,
              color: colors.error,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              AppStrings.invalidCode,
              textAlign: TextAlign.left,
              style: TextStyle(color: colors.error, fontSize: 13),
            ),
          ),
        ],
      ),
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

  void handleResendCodeState(BuildContext context, ForgetPasswordState state) {
    if (state.forgetPasswordResource.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.anotherCodeHasBeenSent),
        ),
      );
    }
    if (state.forgetPasswordResource.isError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "${state.forgetPasswordResource.errorMessage}")),
      );

    }
  }

  void handleResetCodeState(BuildContext context, ResetCodeState state) {
    if (state.resetCodeResource.isSuccess) {
      Navigator.push(context, AppRoutes.resetPassword(widget.email));
    }
    if (state.resetCodeResource.isError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${state.resetCodeResource.errorMessage ??
                AppStrings.somethingWentWrong} ",
          ),
        ),
      );


    }
  }

  Widget buildHeader() {
    return
      Column(children: [ SizedBox(height: 10),
        Center(
          child: Text(
            AppStrings.emailVerification,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Container(
            width: 300,

            child: Center(
              child: Text(
                AppStrings.enterTheCode,
                style: Theme
                    .of(
                  context,
                )
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),


      ], );
  }

}