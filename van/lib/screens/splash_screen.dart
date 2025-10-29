import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _navigateToLogin();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _animationController.forward();
  }

  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppConstants.forestGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              
              // App Logo and Name
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Column(
                        children: [
                          // Forest Icon with Nature Elements
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white,
                                  Color(0xFFF1F8E9),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(70),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(76),
                                  blurRadius: 25,
                                  offset: const Offset(0, 12),
                                ),
                                BoxShadow(
                                  color: AppConstants.primaryColor.withAlpha(51),
                                  blurRadius: 40,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Background trees
                                Positioned(
                                  top: 25,
                                  left: 20,
                                  child: Icon(
                                    Icons.park,
                                    size: 35,
                                    color: AppConstants.mossGreen.withAlpha(128),
                                  ),
                                ),
                                Positioned(
                                  top: 25,
                                  right: 20,
                                  child: Icon(
                                    Icons.forest,
                                    size: 30,
                                    color: AppConstants.leafGreen.withAlpha(128),
                                  ),
                                ),
                                // Main forest icon
                                Icon(
                                  Icons.nature_people,
                                  size: 70,
                                  color: AppConstants.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: AppConstants.paddingLarge),
                          
                          // App Name
                          Text(
                            AppConstants.appName,
                            style: theme.textTheme.displayMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                          ),
                          
                          const SizedBox(height: AppConstants.paddingSmall),
                          
                          // App Tagline
                          Text(
                            AppConstants.appTagline,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white.withAlpha(230),
                              letterSpacing: 0.8,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              
              const Spacer(flex: 2),
              
              // Loading Indicator
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppConstants.paddingMedium),
                        Text(
                          'Loading...',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary.withAlpha(178),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              
              const SizedBox(height: AppConstants.paddingXLarge),
              
              // Version Info
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value * 0.7,
                    child: Text(
                      'Version ${AppConstants.appVersion}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimary.withAlpha(153),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
