import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/presentation/login/bloc/login_bloc.dart';
import 'package:eeagle_ai/src/presentation/login/widgets/login_or_divider.dart';
import 'package:eeagle_ai/src/presentation/login/widgets/login_primary_button.dart';
import 'package:eeagle_ai/src/presentation/login/widgets/login_social_button.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_screen_background.dart';
import 'package:eeagle_ai/src/presentation/ui/components/eeagle_text_field.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_colors.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<LoginBloc>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    context.read<LoginBloc>().add(
          LoginEvent.loginSubmitted(
            email: _emailController.text,
            password: _passwordController.text,
          ),
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
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                          child: Column(
                            children: [
                              Assets.icons.eegaleIc.image(
                                width: 80,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 24),
                              EeagleText(
                                'Welcome Back!',
                                style: EeagleTextStyles.headlineLarge,
                                textColor: colors.titleNatural,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              EeagleText(
                                'Access your Aurenix Workspace and Continue where you left off ',
                                style: EeagleTextStyles.bodyLarge,
                                textColor: colors.bodyText,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 27),
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
                                textInputAction: TextInputAction.done,
                                autofillHints: const [AutofillHints.password],
                                onSubmitted: (_) {
                                  if (!isLoading) {
                                    _submitLogin();
                                  }
                                },
                                enabled: !isLoading,
                              ),
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: EeagleText(
                                    'Forgot Password?',
                                    style:
                                        EeagleTextStyles.bodyMedium.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: colors.bodyText,
                                    ),
                                    textColor: colors.bodyText,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              LoginPrimaryButton(
                                label: 'Continue Login',
                                isLoading: isLoading,
                                onTap: isLoading ? null : _submitLogin,
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
                              const SizedBox(height: 27),
                              const LoginOrDivider(),
                              const SizedBox(height: 16),
                              LoginSocialButton(
                                label: 'Continue With Google',
                                icon: Assets.icons.login.icGoogle,
                                onTap: () {},
                              ),
                              const SizedBox(height: 12),
                              LoginSocialButton(
                                label: 'Continue With GitHub',
                                icon: Assets.icons.login.icGithub,
                                onTap: () {},
                              ),
                              const SizedBox(height: 27),
                              _RegisterLink(colors: colors),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                        child: _AgreementFooter(colors: colors),
                      ),
                    ],
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

class _RegisterLink extends StatelessWidget {
  const _RegisterLink({required this.colors});

  final EeagleColors colors;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: EeagleTextStyles.bodyMedium.copyWith(color: colors.bodyText),
        children: [
          const TextSpan(text: 'Don\u2019t have an account? '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: () {},
              child: EeagleText(
                'Register Now',
                style: EeagleTextStyles.bodyMedium.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: colors.titleNatural,
                ),
                textColor: colors.titleNatural,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AgreementFooter extends StatelessWidget {
  const _AgreementFooter({required this.colors});

  final EeagleColors colors;

  @override
  Widget build(BuildContext context) {
    final linkStyle = EeagleTextStyles.bodySmall.copyWith(
      color: colors.titleNatural,
      decoration: TextDecoration.underline,
      decorationColor: colors.titleNatural,
    );
    final bodyStyle = EeagleTextStyles.bodySmall.copyWith(
      color: colors.bodyText,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: bodyStyle,
        children: [
          const TextSpan(text: 'By clicking continue you agree to our '),
          TextSpan(text: 'Terms & Conditions', style: linkStyle),
          const TextSpan(text: ' and '),
          TextSpan(text: 'Privacy Policy.', style: linkStyle),
        ],
      ),
    );
  }
}
