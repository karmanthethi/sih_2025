import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/tutorial_screen.dart';
import '../screens/permissions_screen.dart';
import '../screens/login_screen.dart';
import '../screens/farmer_profile_screen.dart';
import '../screens/account_creation_screen.dart';
import '../screens/conversational_interface.dart';
import '../screens/activity_tracking_screen.dart';
import '../screens/advisory_dashboard_screen.dart';
import '../screens/knowledge_base_screen.dart';
import '../screens/settings_help_screen.dart';

class NavigationService extends ChangeNotifier {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  static NavigatorState? get navigator => navigatorKey.currentState;
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/tutorial':
        return MaterialPageRoute(builder: (_) => const TutorialScreen());
      case '/permissions':
        return MaterialPageRoute(builder: (_) => const PermissionsScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/farmer-profile':
        return MaterialPageRoute(builder: (_) => const FarmerProfileScreen());
      case '/account-creation':
        return MaterialPageRoute(builder: (_) => const AccountCreationScreen());
      case '/chat':
        return MaterialPageRoute(builder: (_) => const ConversationalInterface());
      case '/activity-tracking':
        return MaterialPageRoute(builder: (_) => const ActivityTrackingScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const AdvisoryDashboardScreen());
      case '/knowledge-base':
        return MaterialPageRoute(builder: (_) => const KnowledgeBaseScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsHelpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
  
  static void navigateTo(String routeName, {Object? arguments}) {
    navigator?.pushNamed(routeName, arguments: arguments);
  }
  
  static void navigateAndReplace(String routeName, {Object? arguments}) {
    navigator?.pushReplacementNamed(routeName, arguments: arguments);
  }
  
  static void navigateAndClearStack(String routeName, {Object? arguments}) {
    navigator?.pushNamedAndRemoveUntil(
      routeName, 
      (route) => false,
      arguments: arguments,
    );
  }
  
  static void goBack() {
    navigator?.pop();
  }
}