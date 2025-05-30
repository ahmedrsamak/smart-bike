import 'package:flutter/material.dart';

import 'core/constants/colors.dart';
import 'features/dashboard/screens/main_dashboard_screen.dart';
import 'features/maintenance/screens/maintenance.dart';
import 'features/settings/screens/setting.dart';
// import 'package:your_app_name/features/trips/screens/trip_log_screen.dart';
// import 'package:your_app_name/features/maintenance/screens/maintenance_screen.dart';
// import 'package:your_app_name/features/fuel/screens/fuel_screen.dart';
// import 'package:your_app_name/features/settings/screens/settings_screen.dart';
// import 'package:your_app_name/features/auth/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase (required for Google login & Drive sync)
  //await Firebase.initializeApp();

  runApp(const ScooterDashboardApp());
}

class ScooterDashboardApp extends StatelessWidget {
  const ScooterDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scooter Dashboard',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black87,
        ),
      ),
      // Entry screen (can be changed to LoginScreen or Splash later)
      home: const MainDashboardScreen(),

      // Optional route-based navigation (enable later when screens are ready)
      routes: {
        '/dashboard': (context) => const MainDashboardScreen(),
        // '/trips': (context) => const TripLogScreen(),
         '/maintenance': (context) => const MaintenanceScreen(),
        // '/fuel': (context) => const FuelScreen(),
         '/settings': (context) => const SettingsScreen(),
        // '/login': (context) => const LoginScreen(),
      },
    );
  }
}
