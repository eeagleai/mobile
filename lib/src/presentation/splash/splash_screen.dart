import 'package:eeagle_ai/src/di/di_container.dart';
import 'package:eeagle_ai/src/presentation/navigation/routes/routes_constants.dart';
import 'package:eeagle_ai/src/presentation/splash/bloc/auth_bootstrap_bloc.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<AuthBootstrapBloc>()
        ..add(const AuthBootstrapEvent.started()),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  bool _nativeSplashRemoved = false;
  bool _showAnimation = false;
  bool _animationComplete = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_nativeSplashRemoved) {
        return;
      }

      FlutterNativeSplash.remove();
      _nativeSplashRemoved = true;
      setState(() => _showAnimation = true);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onAnimationLoaded(LottieComposition composition) {
    _controller?.dispose();
    _controller = AnimationController(
      vsync: this,
      duration: composition.duration,
    );

    setState(() {});
    _controller!.forward().whenComplete(() {
      _animationComplete = true;
      _tryNavigate();
    });
  }

  void _tryNavigate() {
    if (!mounted || !_animationComplete) {
      return;
    }

    final bootstrapState = context.read<AuthBootstrapBloc>().state;
    if (bootstrapState.isChecking) {
      return;
    }

    final destination = bootstrapState.isAuthenticated
        ? RoutesConstants.home
        : RoutesConstants.login;

    Navigator.of(context).pushReplacementNamed(destination);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = EeagleTheme.of(context).colors.screenBackground;

    return BlocListener<AuthBootstrapBloc, AuthBootstrapState>(
      listenWhen: (previous, current) =>
          previous.isChecking != current.isChecking,
      listener: (context, state) {
        if (!state.isChecking) {
          _tryNavigate();
        }
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: _showAnimation
              ? Lottie.asset(
                  'assets/lotties/eegale_animated_splash.json',
                  controller: _controller,
                  repeat: false,
                  fit: BoxFit.contain,
                  onLoaded: _onAnimationLoaded,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
