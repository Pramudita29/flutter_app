import '../../model/user.dart';

class RemoteDataSource {
  List<User> users = [
    User(
      id: 1,
      name: 'Remote Salman',
      age: 30,
    ),
    User(
      id: 2,
      name: 'Remote katrina',
      age: 25,
    ),
    User(
      id: 3,
      name: 'Remote Vicky',
      age: 35,
    )
  ];

  // Add user
  bool addUser(User user) {
    return true;
  }

  // Get user
  List<User> getUsers() {
    return users;
  }
}