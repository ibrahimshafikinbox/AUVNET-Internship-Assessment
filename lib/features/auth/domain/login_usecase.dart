
import 'package:auvnet_flutter_internship/features/auth/data/auth_repository.dart';
import 'package:auvnet_flutter_internship/features/auth/entities/user_entity.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> call(String email, String password) async {
    
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password cannot be empty.');
    }
    return await repository.signInWithEmailAndPassword(email, password);
  }
}
