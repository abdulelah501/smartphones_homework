
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'عبدالإله',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'الرقم الأكاديمي: [443229442]',
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
          ],
        ),
      ),
    ),
  ),
);



