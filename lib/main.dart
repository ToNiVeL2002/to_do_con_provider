import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_simple_con_provider/providers/providers.dart';
import 'package:to_do_simple_con_provider/screens/screens.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ( _ ) => ToDoProvider())
    ],
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : ( _ ) => HomeScreen()
      },
      // theme: ThemeData(
      //   primaryColor: const Color(0xff7B66FF),
      //   // useMaterial3: false,
      //   appBarTheme: const AppBarTheme(
      //     color: Color(0xff7B66FF),
      //   ),
      //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //     backgroundColor: Color(0xff7B66FF),
      //     elevation: 15
      //   ),
      // ),
    );
  }
}


