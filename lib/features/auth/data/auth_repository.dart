


































import 'package:auvnet_flutter_internship/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:auvnet_flutter_internship/features/auth/entities/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<UserEntity> signInWithEmailAndPassword(String email, String password) {
    return _remoteDataSource.signInWithEmailAndPassword(email, password);
  }

  
  @override
  Future<UserEntity> signUpWithEmailAndPassword(String email, String password) {
    return _remoteDataSource.signUpWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signOut() {
    return _remoteDataSource.signOut();
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return _remoteDataSource.authStateChanges.map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }
      return UserEntity.fromFirebaseUser(firebaseUser);
    });
  }
}

abstract class AuthRepository {
  Future<UserEntity> signInWithEmailAndPassword(String email, String password);
  
  Future<UserEntity> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Stream<UserEntity?> get authStateChanges;
}
