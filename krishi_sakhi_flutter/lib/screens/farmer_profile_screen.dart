import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/app_theme.dart';

class FarmerProfileScreen extends StatefulWidget {
  const FarmerProfileScreen({super.key});

  @override
  State<FarmerProfileScreen> createState() => _FarmerProfileScreenState();
}

class _FarmerProfileScreenState extends State<FarmerProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _farmerNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _farmLocationController = TextEditingController();
  final _farmSizeController = TextEditingController();
  
  String? _selectedDistrict;
  String? _selectedCrop;
  
  final List<String> _districts = [
    'Thiruvananthapuram',
    'Kollam',
    'Pathanamthitta',
    'Alappuzha',
    'Kottayam',
    'Idukki',
    'Ernakulam',
    'Thrissur',
    'Palakkad',
    'Malappuram',
    'Kozhikode',
    'Wayanad',
    'Kannur',
    'Kasaragod',
  ];
  
  final List<String> _crops = [
    'Rice',
    'Coconut',
    'Rubber',
    'Pepper',
    'Cardamom',
    'Tea',
    'Coffee',
    'Banana',
    'Tapioca',
    'Ginger',
    'Turmeric',
    'Vegetables',
  ];

  @override
  void dispose() {
    _farmerNameController.dispose();
    _phoneController.dispose();
    _farmLocationController.dispose();
    _farmSizeController.dispose();
    super.dispose();
  }

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
              // Header with back button and Ashoka Chakra
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
                    Expanded(
                      child: Text(
                        'Farmer & Farm Profile',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppTheme.blueChakra,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.account_circle,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        
                        // Profile picture placeholder
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppTheme.green,
                                    width: 3,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextButton.icon(
                                onPressed: () {
                                  // Handle photo upload
                                  _showPhotoOptions(context);
                                },
                                icon: const Icon(
                                  Icons.photo_camera,
                                  color: AppTheme.green,
                                ),
                                label: Text(
                                  'Upload Photo',
                                  style: TextStyle(
                                    color: AppTheme.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Farmer name
                        TextFormField(
                          controller: _farmerNameController,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Phone number
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            hintText: 'Enter your phone number',
                            prefixIcon: Icon(Icons.phone),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // District dropdown
                        DropdownButtonFormField<String>(
                          value: _selectedDistrict,
                          decoration: const InputDecoration(
                            labelText: 'District',
                            prefixIcon: Icon(Icons.location_on),
                          ),
                          items: _districts.map((district) {
                            return DropdownMenuItem(
                              value: district,
                              child: Text(district),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedDistrict = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select your district';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Farm size
                        TextFormField(
                          controller: _farmSizeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Farm Size (in acres)',
                            hintText: 'e.g., 2.5',
                            prefixIcon: Icon(Icons.straighten),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your farm size';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Primary crop dropdown
                        DropdownButtonFormField<String>(
                          value: _selectedCrop,
                          decoration: const InputDecoration(
                            labelText: 'Primary Crop',
                            prefixIcon: Icon(Icons.agriculture),
                          ),
                          items: _crops.map((crop) {
                            return DropdownMenuItem(
                              value: crop,
                              child: Text(crop),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCrop = value;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select your primary crop';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Continue button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Save and Continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _handleContinue() {
    if (_formKey.currentState!.validate()) {
      // Save profile data (in a real app, this would be saved to storage/API)
      NavigationService.navigateTo('/account-creation');
    }
  }
  
  void _showPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                // Handle camera
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                // Handle gallery
              },
            ),
          ],
        ),
      ),
    );
  }
}