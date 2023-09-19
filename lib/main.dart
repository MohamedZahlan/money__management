import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_management/screens/splash_screen.dart';
import 'package:money_management/shared/cubit/bloc_observer.dart';
import 'package:money_management/shared/cubit/money_cubit.dart';
import 'package:money_management/shared/network/shared.styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoneyCubit()..createDataBase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
