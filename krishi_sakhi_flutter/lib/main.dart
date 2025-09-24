import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'utils/app_theme.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(const KrishiSakhiApp());
}

class KrishiSakhiApp extends StatelessWidget {
  const KrishiSakhiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationService()),
      ],
      child: MaterialApp(
        title: 'Krishi Sakhi',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: NavigationService.generateRoute,
      ),
    );
  }
}