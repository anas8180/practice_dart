import 'package:flutter/material.dart';
import 'package:practice_dart/Employee/employee_list_screen.dart';
import 'package:practice_dart/employee/employee_view_model.dart';
import 'package:practice_dart/notes/note_page.dart';
import 'package:practice_dart/test_page_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmployeeViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.blueGrey.shade900,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.white
            ),
          ),
        /*theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amberAccent,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)
          )
        ),*/
        debugShowCheckedModeBanner: false,
        home: const NotePage()
      ),
    );
  }
}

