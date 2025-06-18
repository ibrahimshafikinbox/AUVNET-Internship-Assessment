

import 'package:auvnet_flutter_internship/features/auth/data/auth_repository.dart';
import 'package:auvnet_flutter_internship/features/auth/entities/user_entity.dart';


class SignUpUseCase {
  final AuthRepository repository;

  
  
  SignUpUseCase(this.repository);

  
  
  
  
  
  
  
  Future<UserEntity> call(String email, String password) async {
    
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password cannot be empty.');
    }
    
    if (password.length < 6) {
      
      throw Exception('Password must be at least 6 characters long.');
    }

    return await repository.signUpWithEmailAndPassword(email, password);
  }
}
