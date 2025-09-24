import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/app_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                
                // App logo and title
                Column(
                  children: [
                    Text(
                      'Krishi Sakhi',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.saffron,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your AI Farming Companion',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Empowering Kerala\'s farmers with intelligent insights.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                
                const Spacer(),
                
                // Next button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      NavigationService.navigateTo('/tutorial');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.saffron,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}