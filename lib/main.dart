import 'package:flutter/material.dart';

import 'student_form.dart';
import 'student_list.dart';

void main() {
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      initialRoute: '/',
      routes: {
        '/': (context) => StudentList(), // Home Page
        '/form': (context) => StudentForm(), // Form Page
      },
    );
  }
}
