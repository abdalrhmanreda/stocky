import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/authentication/screens/login_screen/login_screen.dart';
import 'package:project1/core/cubit/app_cubit.dart';
import 'package:project1/core/cubit/observer/blocObserver.dart';
import 'package:project1/core/themes.dart';
import 'package:project1/homePage.dart';

import 'authentication/screens/register_screen/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DataBase.createDataBase();
//await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()..createDataBase()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          theme: Style.lightTheme,
          themeMode: ThemeMode.light,
          routes: {
            "signup": (context) => const RegisterScreen(),
            "login": (context) => const LoginScreen(),
            "homepage": (context) => const HomePage()
          },
        ),
      ),
    );
  }
}
