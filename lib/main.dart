import 'package:firebasepractice/Model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'AppPage/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
        create: (context) => Model(), child: SplashScreen()),
  ));
}
