import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CategoryScreen.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController beforeController = TextEditingController();
  final TextEditingController afterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Row(
          children: [
            Text(
              'Hello!',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Input Blood Sugar Data',
              style: TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 8),
          Image.asset(
            'assets/dia.png',
            width: 100,
            height: 150,
          ),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: beforeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Before Meal (mg/dL)',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: afterController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'After Meal (mg/dL)',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                double? before = double.tryParse(beforeController.text);
                double? after = double.tryParse(afterController.text);

                if (before != null && after != null) {
                  if (before >= 0 && after >= 0) {
                    Get.to(() => CategoryScreen(before: before, after: after));
                  } else {
                    Get.defaultDialog(
                        title: 'Invalid Data',
                        middleText: 'Please enter valid blood sugar values.');
                  }
                } else {
                  Get.defaultDialog(
                      title: 'Invalid Data',
                      middleText: 'Please enter valid blood sugar values.');
                }
              },
              icon: Icon(Icons.info),
              label: Text('Show Info'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(), // Rounded shape
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.list, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.calendar_today, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
