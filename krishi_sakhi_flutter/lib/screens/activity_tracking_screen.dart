import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/app_theme.dart';

class ActivityTrackingScreen extends StatefulWidget {
  const ActivityTrackingScreen({super.key});

  @override
  State<ActivityTrackingScreen> createState() => _ActivityTrackingScreenState();
}

class _ActivityTrackingScreenState extends State<ActivityTrackingScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedActivity;
  DateTime? _selectedDate;
  final _notesController = TextEditingController();

  final List<String> _activities = [
    'Sowing',
    'Irrigation',
    'Fertilizing',
    'Pest Control',
    'Harvesting',
  ];

  final List<ActivityLog> _logs = [
    ActivityLog(
      activity: 'Sowing',
      date: DateTime.now().subtract(const Duration(days: 7)),
      notes: 'Planted rice in the main field',
    ),
    ActivityLog(
      activity: 'Irrigation',
      date: DateTime.now().subtract(const Duration(days: 3)),
      notes: 'Watered all crops',
    ),
  ];

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
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    Expanded(
                      child: Text(
                        'Farming Activities',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 18,
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
                      // Activity logging form
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Log New Activity',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.green,
                                ),
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Activity type dropdown
                              DropdownButtonFormField<String>(
                                value: _selectedActivity,
                                decoration: const InputDecoration(
                                  labelText: 'Activity Type',
                                ),
                                items: _activities.map((activity) {
                                  return DropdownMenuItem(
                                    value: activity,
                                    child: Text(activity),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedActivity = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select an activity';
                                  }
                                  return null;
                                },
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Date picker
                              InkWell(
                                onTap: _selectDate,
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Date',
                                  ),
                                  child: Text(
                                    _selectedDate != null
                                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                        : 'Select date',
                                    style: TextStyle(
                                      color: _selectedDate != null 
                                          ? Colors.black87
                                          : Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Notes
                              TextFormField(
                                controller: _notesController,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  labelText: 'Notes',
                                  hintText: 'Add a quick note...',
                                ),
                              ),
                              
                              const SizedBox(height: 24),
                              
                              // Submit button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _logActivity,
                                  child: const Text('Log Activity'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Previously logged activities
                      Text(
                        'Previously Logged',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.green,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      ..._logs.map((log) => _buildLogItem(log)).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildLogItem(ActivityLog log) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.activity,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (log.notes.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    log.notes,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ],
            ),
          ),
          Text(
            '${log.date.day}/${log.date.month}/${log.date.year}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
  
  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }
  
  void _logActivity() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      setState(() {
        _logs.insert(0, ActivityLog(
          activity: _selectedActivity!,
          date: _selectedDate!,
          notes: _notesController.text,
        ));
      });
      
      // Clear form
      setState(() {
        _selectedActivity = null;
        _selectedDate = null;
        _notesController.clear();
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Activity logged successfully!')),
      );
    } else if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date')),
      );
    }
  }
}

class ActivityLog {
  final String activity;
  final DateTime date;
  final String notes;
  
  ActivityLog({
    required this.activity,
    required this.date,
    required this.notes,
  });
}