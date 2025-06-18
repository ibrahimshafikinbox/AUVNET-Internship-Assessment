import 'dart:async';
import 'package:auvnet_flutter_internship/features/auth/data/auth_repository.dart'; 
import 'package:auvnet_flutter_internship/features/auth/domain/login_usecase.dart';
import 'package:auvnet_flutter_internship/features/auth/domain/logout_usecase.dart';
import 'package:auvnet_flutter_internship/features/auth/domain/signup_usecase.dart';
import 'package:auvnet_flutter_internship/features/auth/entities/user_entity.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_event.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_state.dart';
import 'package:bloc/bloc.dart'; 

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase; 
  final SignUpUseCase _signUpUseCase; 
  final AuthRepository _authRepository;
  StreamSubscription? _userSubscription;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required AuthRepository authRepository,
    required LogoutUseCase logoutUseCase, 
    required SignUpUseCase signUpUseCase, 
  })  : _loginUseCase = loginUseCase,
        _authRepository = authRepository,
        _logoutUseCase = logoutUseCase,
        _signUpUseCase = signUpUseCase,
        super(AuthInitial()) {
    
    on<AppStarted>(_onAppStarted);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<LogoutRequested>(
        _onLogoutRequested); 
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  

  
  
  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); 
    try {
      _userSubscription = _authRepository.authStateChanges.listen((user) {
        if (user != null) {
          
          add(LoggedIn(user)); 
        } else {
          
          add(LoggedOut()); 
        }
      }, onError: (error) {
        
        add(LoggedOut()); 
        
        
      });
    } catch (e) {
      
      emit(
          const AuthError('Failed to initialize authentication status check.'));
      emit(Unauthenticated());
    }
  }

  
  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); 
    try {
      
      final UserEntity user = await _loginUseCase(event.email, event.password);
      
      
      
      emit(Authenticated(user));
    } catch (e) {
      
      emit(AuthError(e.toString())); 
      emit(Unauthenticated()); 
    }
  }

  
  void _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) {
    emit(Authenticated(event.user)); 
  }

  
  
  void _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) {
    emit(Unauthenticated()); 
  }

  
  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); 
    try {
      await _logoutUseCase(); 
      
      
    } catch (e) {
      
      emit(AuthError(e.toString()));
      
      if (state is Authenticated) {
        emit(Authenticated((state as Authenticated).user));
      } else {
        emit(Unauthenticated());
      }
    }
  }

  
  Future<void> _onRegisterSubmitted(
      RegisterSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading()); 
    try {
      final UserEntity user = await _signUpUseCase(event.email, event.password);
      
      
      
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString())); 
      emit(
          Unauthenticated()); 
    }
  }

  @override
  Future<void> close() {
    _userSubscription
        ?.cancel(); 
    return super.close();
  }
}
