
import 'package:di_repository_application/di/di.dart';
import 'package:di_repository_application/repository/user_repository.dart';

void main() {
  // Load di module
  initModule();
  UserRepository userRepository = getIt<UserRepository>();
  print(userRepository.getUsers());
}