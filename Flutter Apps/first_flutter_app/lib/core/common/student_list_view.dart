import 'package:first_flutter_app/view/student_details_next_page.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/model/student.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({
    super.key,
    required this.lstStudents,
  });

  final List<Student> lstStudents;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: lstStudents.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.people),
            title:
                Text('${lstStudents[index].fname} ${lstStudents[index].lname}'),
            subtitle: Text(lstStudents[index].city),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            onTap: () {
              // Navigate to StudentDetailPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailPage(
                    student: lstStudents[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
