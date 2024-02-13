import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final double before;
  final double after;

  CategoryScreen({required this.before, required this.after});

  @override
  Widget build(BuildContext context) {
    String category = getCategory(before, after);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Blood Sugar Category',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.access_time, color: Colors.white),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Image.asset(
                'assets/blood.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 16),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category: $category',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Blood Sugar Levels:',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Before Meal: $before',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'After Meal: $after',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _getCategoryDescription(category),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Colors.grey,
                        ),
                      ),
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

  String getCategory(double before, double after) {
    if (before < 100 && after < 140) {
      return 'Normal';
    } else if (before < 126 && after < 180) {
      return 'Prediabetes';
    } else if (before >= 126 && before <= 180 && after >= 180 && after <= 200) {
      return 'Prediabetes';
    } else {
      return 'Diabetes';
    }
  }

  String _getCategoryDescription(String category) {
    switch (category) {
      case 'Normal':
        return 'Your blood sugar levels are within the normal range.';
      case 'Prediabetes':
        return 'Your blood sugar levels indicate prediabetes. It is recommended to consult a healthcare professional for further evaluation and management.';
      case 'Diabetes':
        return 'Your blood sugar levels indicate diabetes. It is important to consult a healthcare professional for proper diagnosis and management.';
      default:
        return '';
    }
  }
}
