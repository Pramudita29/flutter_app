import 'package:di_repository_application/model/user.dart';
import 'package:di_repository_application/repository/user_repository.dart';

import '../di/di.dart';

void main() {
  // Load di module
  initModule();
  User user = User(
    id: 1,
    name: 'John Doe',
    age: 30,
  );

  // UserRepository userRepository = UserRepository();
  // Get the UserRepository instance from GetIt
  UserRepository userRepository = getIt<UserRepository>();

  if (userRepository.addUser(user)) {
    print('User added successfully');
  } else {
    print('User not added');
  }
}