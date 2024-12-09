import 'package:first_flutter_app/core/common/student_list_view.dart';
import 'package:first_flutter_app/model/student.dart';
import 'package:flutter/material.dart';
 
class StudentDetailsView extends StatefulWidget {
  const StudentDetailsView({super.key});
 
  @override
  State<StudentDetailsView> createState() => _StudentDetailsViewState();
}
 
class _StudentDetailsViewState extends State<StudentDetailsView> {
  final _gap = const SizedBox(height: 8);
  final items = [
    const DropdownMenuItem(value: "Kathmandu", child: Text("Kathmandu")),
    const DropdownMenuItem(value: "Pokhara", child: Text("Pokhara")),
    const DropdownMenuItem(value: "Chitwan", child: Text("Chitwan")),
  ];
  List<Student> lstStudents = [];
 
  String? selectedCity;
 
  //controller
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _fnameController,
              decoration: const InputDecoration(
                labelText: "Enter first name",
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            DropdownButtonFormField(
              items: items,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Select City",
              ),
            ),
            _gap,
            TextFormField(
              controller: _lnameController,
              decoration: const InputDecoration(
                labelText: "Enter last name",
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Student student = Student(
                        fname: _fnameController.text.trim(),
                        lname: _lnameController.text.trim(),
                        city: selectedCity!);
                    setState(() {
                      lstStudents.add(student);
                    });
                    debugPrint(lstStudents.length.toString());
                  },
                  child: const Text("Add Student")),
            ),
            _gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/output",
                        arguments: lstStudents);
                  },
                  child: const Text("View Students")),
            ),
 
            //Display student details in listView
            lstStudents.isEmpty
                ? const Text("No Data")
                : StudentListView(lstStudents: lstStudents),
          ],
        ),
      ),
    );
  }
 
  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    super.dispose();
  }
}
 
