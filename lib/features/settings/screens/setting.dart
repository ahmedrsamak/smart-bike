import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/colors.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool useMetric = true;
  bool autoSyncToDrive = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      darkMode = prefs.getBool('darkMode') ?? false;
      useMetric = prefs.getBool('useMetric') ?? true;
      autoSyncToDrive = prefs.getBool('autoSyncToDrive') ?? true;
    });
  }

  Future<void> _updateSetting(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('⚙️ Settings'),
        backgroundColor: AppColors.darkCard,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Preferences',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          SwitchListTile(
            title: const Text('Dark Mode', style: TextStyle(color: Colors.white)),
            value: darkMode,
            activeColor: AppColors.primary,
            onChanged: (val) {
              setState(() => darkMode = val);
              _updateSetting('darkMode', val);
              // TODO: Apply theme globally if needed
            },
          ),
          SwitchListTile(
            title: const Text('Use Metric Units (km, °C)', style: TextStyle(color: Colors.white)),
            value: useMetric,
            activeColor: AppColors.primary,
            onChanged: (val) {
              setState(() => useMetric = val);
              _updateSetting('useMetric', val);
            },
          ),
          SwitchListTile(
            title: const Text('Auto Sync to Google Drive', style: TextStyle(color: Colors.white)),
            value: autoSyncToDrive,
            activeColor: AppColors.primary,
            onChanged: (val) {
              setState(() => autoSyncToDrive = val);
              _updateSetting('autoSyncToDrive', val);
            },
          ),

          const Divider(color: Colors.white24, height: 30),
          Text(
            'Account',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text('Google Account', style: TextStyle(color: Colors.white)),
            subtitle: const Text('example@gmail.com', style: TextStyle(color: Colors.white70)),
            trailing: const Icon(Icons.logout, color: Colors.redAccent),
            onTap: () {
              // TODO: Add Google Sign-Out logic
            },
          ),

          const Divider(color: Colors.white24, height: 30),
          Text(
            'System',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.white),
            title: const Text('About', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Version 1.0.0'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Scooter Companion",
                applicationVersion: "1.0.0",
                applicationLegalese: "© 2025 Your Company",
              );
            },
          ),
        ],
      ),
    );
  }
}
