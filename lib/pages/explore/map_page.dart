import 'package:flutter/material.dart';
import '../../utils/constants.dart';
// import 'package:get/get.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map View')),
      body: Center(
        child: Text(
          'Map functionality will be implemented here\nusing Google Maps Flutter package',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textSecondary),
        ),
      ),
    );
  }
}
