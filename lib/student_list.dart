import 'package:flutter/material.dart';

import 'student.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student> students = []; // Initialize an empty list of students

  void _addStudent(Student student) {
    setState(() {
      students.add(student); // Add student to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final newStudent = await Navigator.pushNamed(context, '/form');
              if (newStudent != null) {
                _addStudent(newStudent as Student);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentDetail(student: students[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StudentDetail extends StatelessWidget {
  final Student student;

  const StudentDetail({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Details')),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                student.name,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Address:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                student.address,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Age:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                student.age.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
