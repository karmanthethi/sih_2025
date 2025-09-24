import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.repeat(reverse: true);

    // Navigate to welcome screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      NavigationService.navigateAndReplace('/welcome');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.backgroundLight,
              Colors.white,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background pattern/texture
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
            
            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo/icon
                  AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _pulseAnimation.value,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: AppTheme.saffron,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.agriculture,
                            size: 96,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // App name
                  Text(
                    'Krishi Sakhi',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[900],
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Tagline
                  Text(
                    'Your AI-powered farming assistant for Kerala',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            // Bottom pulse indicator
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}