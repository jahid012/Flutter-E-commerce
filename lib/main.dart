import 'package:bcommerce/auth/google_sign_in.dart';
import 'package:bcommerce/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ));
}
