import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/presentation/login/widgets/login_primary_button.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:eeagle_ai/src/presentation/signup/bloc/signup_bloc.dart';
import 'package:eeagle_ai/src/presentation/signup/signup_verification_screen.dart';
import 'package:eeagle_ai/src/presentation/signup/widgets/signup_terms_checkbox.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_screen_background.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_text_field.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<SignupBloc>(),
      child: const _SignupView(),
    );
  }
}

class _SignupView extends StatefulWidget {
  const _SignupView();

  @override
  State<_SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<_SignupView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agree = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitSignup() {
    context.read<SignupBloc>().add(
      SignupEvent.signupSubmitted(
        email: _emailController.text,
        password: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
        agree: _agree,
      ),
    );
  }

  void _openVerificationScreen(SignupState state) {
    final message = state.successMessage ??
        'Account created. Check your email to verify your address.';

    Navigator.of(context).pushReplacementNamed(
      RoutesConstants.signupVerification,
      arguments: SignupVerificationScreenArgs(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        message: message,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return BlocListener<SignupBloc, SignupState>(
      listenWhen: (previous, current) =>
          previous.signupSucceeded != current.signupSucceeded ||
          (previous.submissionAttempt != current.submissionAttempt &&
              current.errorMessage != null),
      listener: (context, state) {
        if (state.signupSucceeded) {
          _openVerificationScreen(state);
          return;
        }

        final errorMessage = state.errorMessage;
        if (errorMessage != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(errorMessage)));
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          final isLoading = state.isLoading;

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              fit: StackFit.expand,
              children: [
                const EeagleScreenBackground(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            tooltip: 'Back',
                            onPressed: isLoading
                                ? null
                                : () => Navigator.of(context).pop(),
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: colors.titleNatural,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Assets.icons.eegaleIc.image(
                                  width: 76,
                                  height: 76,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 24),
                                EeagleText(
                                  'Create Account',
                                  style: EeagleTextStyles.headlineLarge,
                                  textColor: colors.titleNatural,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                EeagleText(
                                  'Sign up with your email and password',
                                  style: EeagleTextStyles.bodyLarge,
                                  textColor: colors.bodyText,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 28),
                                EeagleTextField(
                                  controller: _emailController,
                                  hintText: 'Enter your email',
                                  prefixIcon: Assets.icons.login.icEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  autofillHints: const [AutofillHints.email],
                                  enabled: !isLoading,
                                ),
                                const SizedBox(height: 12),
                                EeagleTextField(
                                  controller: _passwordController,
                                  hintText: 'Enter your password',
                                  prefixIcon: Assets.icons.login.icLock,
                                  suffixIcon: Assets.icons.login.icEyeOff,
                                  obscureText: _obscurePassword,
                                  onSuffixTap: isLoading
                                      ? null
                                      : () {
                                          setState(
                                            () => _obscurePassword =
                                                !_obscurePassword,
                                          );
                                        },
                                  textInputAction: TextInputAction.next,
                                  autofillHints: const [
                                    AutofillHints.newPassword,
                                  ],
                                  enabled: !isLoading,
                                ),
                                const SizedBox(height: 12),
                                EeagleTextField(
                                  controller: _confirmPasswordController,
                                  hintText: 'Confirm your password',
                                  prefixIcon: Assets.icons.login.icLock,
                                  suffixIcon: Assets.icons.login.icEyeOff,
                                  obscureText: _obscureConfirmPassword,
                                  onSuffixTap: isLoading
                                      ? null
                                      : () {
                                          setState(
                                            () => _obscureConfirmPassword =
                                                !_obscureConfirmPassword,
                                          );
                                        },
                                  textInputAction: TextInputAction.done,
                                  autofillHints: const [
                                    AutofillHints.newPassword,
                                  ],
                                  onSubmitted: (_) {
                                    if (!isLoading) {
                                      _submitSignup();
                                    }
                                  },
                                  enabled: !isLoading,
                                ),
                                const SizedBox(height: 16),
                                SignupTermsCheckbox(
                                  value: _agree,
                                  enabled: !isLoading,
                                  onChanged: (value) =>
                                      setState(() => _agree = value),
                                ),
                                if (state.errorMessage != null) ...[
                                  const SizedBox(height: 12),
                                  EeagleText(
                                    state.errorMessage!,
                                    style: EeagleTextStyles.bodySmall,
                                    textColor: colors.error,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        LoginPrimaryButton(
                          label: 'Create Account',
                          isLoading: isLoading,
                          onTap: isLoading ? null : _submitSignup,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
