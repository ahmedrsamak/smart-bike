// Flutter code for MainDashboardScreen updated layout

import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../shared/widgets/dashboard_button.dart';
import '../../../shared/widgets/sensor_circle_widget.dart';
import '../../../shared/widgets/tilt_scooter_display.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 16),

            // Top Row with SensorCircles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SensorCircleWidget(
                    icon: Icons.gps_fixed,
                    label: 'Speed',
                    value: '42 km/h',
                    color: AppColors.primary,
                  ),
                  SensorCircleWidget(
                    icon: Icons.device_thermostat,
                    label: 'Temp',
                    value: '38°C',
                    color: AppColors.warning,
                  ),
                  SensorCircleWidget(
                    icon: Icons.bluetooth,
                    label: 'BT',
                    value: 'Connected',
                    color: AppColors.success,
                    onTap: null, // TODO: Connect with bluetooth
                    enableTapEffect: true,
                  ),
                  SensorCircleWidget(
                    icon: Icons.battery_charging_full,
                    label: 'Voltage',
                    value: '12.6V',
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Center Tilt Scooter Display
            const TiltScooterDisplay(tiltAngleDegrees: 0),

            const SizedBox(height: 24),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DashboardButton(
                    icon: Icons.track_changes,
                    label: 'Trip Log',
                    onTap: null, // TODO: Connect trip log screen
                  ),
                  const DashboardButton(
                    icon: Icons.local_gas_station,
                    label: 'Fuel',
                    onTap: null, // TODO: Connect fuel screen
                  ),
                  DashboardButton(
                    icon: Icons.build_circle,
                    label: 'Maintenance',
                    onTap: () {
                      Navigator.pushNamed(context, '/maintenance');
                    },
                  ),
                  DashboardButton(
                    icon: Icons.settings,
                    label: 'Settings',
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
