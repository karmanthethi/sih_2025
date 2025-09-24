import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/app_theme.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

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
          child: Column(
            children: [
              // Header with back button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        NavigationService.goBack();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title and description
                      Text(
                        'Let\'s set you up',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 12),
                      
                      Text(
                        'To give you the best experience, we need to ask for a few permissions.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 48),
                      
                      // Permission items
                      _buildPermissionItem(
                        context,
                        icon: Icons.location_on,
                        title: 'Location Access',
                        description: 'Required for personalized weather forecasts and market prices in your area.',
                      ),
                      
                      const SizedBox(height: 32),
                      
                      _buildPermissionItem(
                        context,
                        icon: Icons.notifications,
                        title: 'Notifications',
                        description: 'To send you timely alerts for pest control, irrigation, and harvesting.',
                      ),
                      
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              
              // Action buttons
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Skip permissions for now and go to login
                          NavigationService.navigateTo('/login');
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        child: Text(
                          'Deny',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _requestPermissions(context);
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
                          'Allow Access',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildPermissionItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon container
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppTheme.saffron.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            size: 28,
            color: AppTheme.saffron,
          ),
        ),
        
        const SizedBox(width: 16),
        
        // Text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              
              const SizedBox(height: 4),
              
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  void _requestPermissions(BuildContext context) async {
    // In a real app, you would request actual permissions here
    // For this demo, we'll just simulate it and navigate to login
    
    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.saffron),
        ),
      ),
    );
    
    // Simulate permission request delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Close loading dialog
    Navigator.of(context).pop();
    
    // Navigate to login
    NavigationService.navigateTo('/login');
  }
}