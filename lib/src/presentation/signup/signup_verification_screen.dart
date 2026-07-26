import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/presentation/login/bloc/login_bloc.dart';
import 'package:eeagle_ai/src/presentation/login/widgets/login_primary_button.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:eeagle_ai/src/presentation/signup/widgets/signup_verification_email_card.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_screen_background.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupVerificationScreenArgs {
  const SignupVerificationScreenArgs({
    required this.email,
    required this.password,
    required this.message,
  });

  final String email;
  final String password;
  final String message;
}

class SignupVerificationScreen extends StatelessWidget {
  const SignupVerificationScreen({
    super.key,
    required this.args,
    LoginBloc? loginBloc,
  }) : _loginBloc = loginBloc;

  final SignupVerificationScreenArgs args;
  final LoginBloc? _loginBloc;

  @override
  Widget build(BuildContext context) {
    final child = _SignupVerificationView(args: args);

    if (_loginBloc != null) {
      return BlocProvider.value(
        value: _loginBloc,
        child: child,
      );
    }

    return BlocProvider(
      create: (_) => di<LoginBloc>(),
      child: child,
    );
  }
}

class _SignupVerificationView extends StatelessWidget {
  const _SignupVerificationView({required this.args});

  final SignupVerificationScreenArgs args;

  void _submitLogin(BuildContext context) {
    context.read<LoginBloc>().add(
      LoginEvent.loginSubmitted(
        email: args.email,
        password: args.password,
      ),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RoutesConstants.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;

    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginSucceeded != current.loginSucceeded ||
          (previous.submissionAttempt != current.submissionAttempt &&
              current.errorMessage != null),
      listener: (context, state) {
        if (state.loginSucceeded) {
          Navigator.of(context).pushReplacementNamed(RoutesConstants.home);
          return;
        }

        final errorMessage = state.errorMessage;
        if (errorMessage != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(errorMessage)));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
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
                            tooltip: 'Back to login',
                            onPressed: isLoading
                                ? null
                                : () => _goToLogin(context),
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
                                Icon(
                                  Icons.mark_email_read_rounded,
                                  color: colors.brandPrimaryAccent,
                                  size: 68,
                                ),
                                const SizedBox(height: 24),
                                EeagleText(
                                  'Check your email',
                                  style: EeagleTextStyles.headlineLarge,
                                  textColor: colors.titleNatural,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                EeagleText(
                                  args.message,
                                  style: EeagleTextStyles.bodyLarge,
                                  textColor: colors.bodyText,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),
                                SignupVerificationEmailCard(email: args.email),
                                const SizedBox(height: 16),
                                EeagleText(
                                  'After verifying your email, tap Login below to continue.',
                                  style: EeagleTextStyles.bodyMedium,
                                  textColor: colors.foregroundSecondary,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        LoginPrimaryButton(
                          label: 'Login',
                          isLoading: isLoading,
                          onTap: isLoading
                              ? null
                              : () => _submitLogin(context),
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
