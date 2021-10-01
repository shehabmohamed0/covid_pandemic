import 'package:covid_pandemic/auth%20module/data/repositories/authentication_repository.dart';
import 'package:covid_pandemic/auth%20module/logic/cubit/signIn/sign_in_cubit.dart';
import 'package:covid_pandemic/auth%20module/presentation/routes/app_router.dart';
import 'package:covid_pandemic/logic/cubit/articles/articles_cubit.dart';
import 'package:covid_pandemic/presentation/screens/bottom_nav_screen.dart';
import 'package:covid_pandemic/presentation/screens/health_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth module/logic/cubit/auth/auth_cubit.dart';
import 'auth module/logic/cubit/signUp/sign_up_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => SignInCubit(AuthenticationRepository()),
        ),
        BlocProvider(
          create: (BuildContext context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Covid Pandemic',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
        // home: BottomNavScreen(),
      ),
    );
  }
}
