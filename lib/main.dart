import 'package:bottle_ver2/authentication/login.dart';
import 'package:bottle_ver2/providers/userProvider.dart';
import 'package:bottle_ver2/screens/gamrProfileScreen.dart';
import 'package:bottle_ver2/screens/homeScreen.dart';
import 'package:bottle_ver2/screens/temp.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'dbOperations/dbManager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (context) {
          userProvider.getAllUsersStream();
          if (authUser != null) userProvider.setLoggedInUser(authUser!.email!);
          return userProvider;
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: customTheme,
        home: HomeScreen(),
      ),
    );
  }
}
