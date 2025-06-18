
import 'package:firebase_auth/firebase_auth.dart'; 

class UserEntity {
  final String uid;
  final String email;
  

  UserEntity({
    required this.uid,
    required this.email,
  });

  
  factory UserEntity.fromFirebaseUser(User firebaseUser) {
    
    return UserEntity(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '', 
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity && other.uid == uid && other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;
}
