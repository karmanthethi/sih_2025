import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/app_theme.dart';

class SettingsHelpScreen extends StatelessWidget {
  const SettingsHelpScreen({super.key});

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
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => NavigationService.goBack(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Text(
                        'Settings & Help',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    // Profile section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: AppTheme.saffron,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'John Farmer',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Thrissur, Kerala',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  'Rice, Coconut farmer',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.edit,
                            color: AppTheme.green,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Settings sections
                    _buildSection('Account Settings', [
                      _buildSettingsItem(
                        icon: Icons.person_outline,
                        title: 'Edit Profile',
                        subtitle: 'Update your personal information',
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        icon: Icons.security,
                        title: 'Privacy & Security',
                        subtitle: 'Manage your privacy settings',
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        icon: Icons.notifications_outlined,
                        title: 'Notifications',
                        subtitle: 'Configure notification preferences',
                        onTap: () {},
                      ),
                    ]),
                    
                    const SizedBox(height: 16),
                    
                    _buildSection('App Settings', [
                      _buildSettingsItem(
                        icon: Icons.language,
                        title: 'Language',
                        subtitle: 'Malayalam (മലയാളം)',
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        icon: Icons.dark_mode_outlined,
                        title: 'Theme',
                        subtitle: 'System default',
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        icon: Icons.storage,
                        title: 'Data & Storage',
                        subtitle: 'Manage offline data',
                        onTap: () {},
                      ),
                    ]),
                    
                    const SizedBox(height: 16),
                    
                    _buildSection('Help & Support', [
                      _buildSettingsItem(
                        icon: Icons.help_outline,
                        title: 'Help Center',
                        subtitle: 'Get help and support',
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        icon: Icons.phone,
                        title: 'Contact Support',
                        subtitle: '+91 1800-XXX-XXXX',
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        icon: Icons.feedback_outlined,
                        title: 'Send Feedback',
                        subtitle: 'Help us improve the app',
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        icon: Icons.star_outline,
                        title: 'Rate App',
                        subtitle: 'Rate us on Play Store',
                        onTap: () {},
                      ),
                    ]),
                    
                    const SizedBox(height: 16),
                    
                    _buildSection('About', [
                      _buildSettingsItem(
                        icon: Icons.info_outline,
                        title: 'About Krishi Sakhi',
                        subtitle: 'Version 1.0.0',
                        onTap: () {
                          _showAboutDialog(context);
                        },
                      ),
                      _buildSettingsItem(
                        icon: Icons.description_outlined,
                        title: 'Terms of Service',
                        subtitle: 'Read our terms',
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        icon: Icons.privacy_tip_outlined,
                        title: 'Privacy Policy',
                        subtitle: 'Read our privacy policy',
                        onTap: () {},
                      ),
                    ]),
                    
                    const SizedBox(height: 32),
                    
                    // Logout button
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red.withOpacity(0.3)),
                      ),
                      child: InkWell(
                        onTap: () {
                          _showLogoutDialog(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.green,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(children: items),
        ),
      ],
    );
  }
  
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey[600],
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
  
  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Krishi Sakhi'),
        content: const Text(
          'Krishi Sakhi is an AI-powered farming assistant designed specifically for Kerala\'s smallholder farmers. '
          'Our app provides personalized advice, activity tracking, and local farming knowledge to help improve '
          'productivity and sustainability.\n\n'
          'Version: 1.0.0\n'
          'Built for farmers, by farmers.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              NavigationService.navigateAndClearStack('/');
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}