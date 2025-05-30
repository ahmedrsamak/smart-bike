import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import '../../../core/constants/colors.dart';
/*
 Make sure your CSV has headers like:

sql
Copy
Edit
Task,Interval,Last Done
Engine Oil Change,1000 km,2025-04-01
Brake Check,2000 km,2025-05-01
 */
class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  List<Map<String, String>> maintenanceItems = [];

  Future<void> _importCSV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['csv']);

    if (result != null) {
      File file = File(result.files.single.path!);
      final lines = await file.readAsLines();

      final headers = lines[0].split(',');
      final List<Map<String, String>> parsedItems = [];

      for (var i = 1; i < lines.length; i++) {
        final values = lines[i].split(',');
        if (values.length == headers.length) {
          final item = <String, String>{};
          for (int j = 0; j < headers.length; j++) {
            item[headers[j].trim()] = values[j].trim();
          }
          parsedItems.add(item);
        }
      }

      setState(() {
        maintenanceItems = parsedItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance Plan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_upload),
            onPressed: _importCSV,
            tooltip: 'Import CSV',
          ),
        ],
      ),
      body: maintenanceItems.isEmpty
          ? const Center(child: Text('No maintenance data. Import a CSV to begin.', style: TextStyle(color: Colors.white70)))
          : ListView.builder(
        itemCount: maintenanceItems.length,
        itemBuilder: (context, index) {
          final item = maintenanceItems[index];
          return Card(
            color: AppColors.darkCard,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(
                item['Task'] ?? 'Unknown Task',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Interval: ${item['Interval'] ?? '-'}\nLast Done: ${item['Last Done'] ?? '-'}',
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: Icon(Icons.build, color: AppColors.primary),
            ),
          );
        },
      ),
    );
  }
}
