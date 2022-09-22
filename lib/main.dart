import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ijob_code_cafe/LoginPage/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Column(
                    children: const [
                      Text(
                        'iJob clone loading...',
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Column(
                    children: const [
                      Text(
                        'An error has occurred',
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'iJob Clone App',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              primarySwatch: Colors.blue,
            ),
            home: Login(),
          );
        });
  }
}
