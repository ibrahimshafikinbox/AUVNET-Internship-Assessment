

import 'package:auvnet_flutter_internship/features/auth/data/auth_repository.dart';


class LogoutUseCase {
  final AuthRepository repository;

  
  
  LogoutUseCase(this.repository);

  
  
  Future<void> call() async {
    await repository.signOut();
  }
}
