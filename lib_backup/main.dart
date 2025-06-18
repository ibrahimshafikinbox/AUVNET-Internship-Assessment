import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/features/auth/data/auth_repository.dart';
import 'package:auvnet_flutter_internship/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:auvnet_flutter_internship/features/auth/domain/login_usecase.dart';
import 'package:auvnet_flutter_internship/features/auth/domain/logout_usecase.dart';
import 'package:auvnet_flutter_internship/features/auth/domain/signup_usecase.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_event.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_state.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/home_screen.dart';
import 'package:auvnet_flutter_internship/features/splash/presentation/splash_screen.dart';
import 'package:auvnet_flutter_internship/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSourceImpl(
    firebaseAuth: FirebaseAuth.instance,
  );

  final AuthRepository authRepository = AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );
  final LogoutUseCase logoutUseCase = LogoutUseCase(authRepository);

  final SignUpUseCase signUpUseCase = SignUpUseCase(authRepository);

  final LoginUseCase loginUseCase = LoginUseCase(authRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            loginUseCase: loginUseCase,
            authRepository: authRepository,
            logoutUseCase: logoutUseCase,
            signUpUseCase: signUpUseCase,
          )..add(AppStarted()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nawel App',
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return const HomeScreen();
          } else if (state is Unauthenticated) {
            return const SplashScreen();
          } else if (state is AuthLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return const SplashScreen();
        },
      ),
    );
  }
}
