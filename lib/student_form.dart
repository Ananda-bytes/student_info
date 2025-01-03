import 'package:flutter/material.dart';

import 'student.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _ageController = TextEditingController();

  void _submit() {
    final String name = _nameController.text;
    final String address = _addressController.text;
    final int age = int.tryParse(_ageController.text) ?? 0;

    if (name.isNotEmpty && address.isNotEmpty && age > 0) {
      Navigator.pop(
          context, Student(name, address, age)); // Return new student to list
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
