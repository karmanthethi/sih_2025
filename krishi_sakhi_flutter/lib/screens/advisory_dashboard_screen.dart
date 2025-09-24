import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/app_theme.dart';

class AdvisoryDashboardScreen extends StatelessWidget {
  const AdvisoryDashboardScreen({super.key});

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
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => NavigationService.goBack(),
                      icon: const Icon(Icons.menu),
                    ),
                    Expanded(
                      child: Text(
                        'Krishi Sahayak',
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s Insights',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Weather alert
                      _buildInsightCard(
                        title: 'Weather Alert: Heavy Rainfall Expected',
                        description: 'Prepare for heavy rainfall in your area. Secure crops and livestock.',
                        icon: Icons.cloud_queue,
                        color: Colors.blue,
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Pest alert
                      _buildInsightCard(
                        title: 'Pest Alert: Brown Plant Hopper',
                        description: 'Monitor your rice crops for brown plant hopper. Use recommended treatments.',
                        icon: Icons.bug_report,
                        color: Colors.red,
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Market price
                      _buildInsightCard(
                        title: 'Market Update: Rice Prices Rising',
                        description: 'Current rice prices in your area: ₹25/kg. Good time to sell.',
                        icon: Icons.trending_up,
                        color: AppTheme.green,
                      ),
                      
                      const SizedBox(height: 24),
                      
                      Text(
                        'Quick Actions',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Quick action buttons
                      Row(
                        children: [
                          Expanded(
                            child: _buildActionButton(
                              context,
                              'Chat with AI',
                              Icons.chat,
                              () => NavigationService.navigateTo('/chat'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildActionButton(
                              context,
                              'Log Activity',
                              Icons.add_task,
                              () => NavigationService.navigateTo('/activity-tracking'),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      Row(
                        children: [
                          Expanded(
                            child: _buildActionButton(
                              context,
                              'Knowledge Base',
                              Icons.library_books,
                              () => NavigationService.navigateTo('/knowledge-base'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildActionButton(
                              context,
                              'Settings',
                              Icons.settings,
                              () => NavigationService.navigateTo('/settings'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Bottom navigation
              _buildBottomNavigation(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildInsightCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
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
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildActionButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.saffron.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.saffron.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: AppTheme.saffron,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBottomNavigation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', true, () {}),
          _buildNavItem(Icons.chat, 'Chat', false, () => NavigationService.navigateTo('/chat')),
          _buildNavItem(Icons.calendar_today, 'Activities', false, () => NavigationService.navigateTo('/activity-tracking')),
          _buildNavItem(Icons.person, 'Profile', false, () => NavigationService.navigateTo('/settings')),
        ],
      ),
    );
  }
  
  Widget _buildNavItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.saffron.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppTheme.saffron : Colors.grey,
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isActive ? AppTheme.saffron : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}