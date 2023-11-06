import 'package:bottle_ver2/authentication/login.dart';
import 'package:bottle_ver2/models/tournamentModels/playerProvider.dart';
import 'package:bottle_ver2/providers/userProvider.dart';
import 'package:bottle_ver2/screens/gameProfileScreenLayout.dart';
import 'package:bottle_ver2/screens/playerProfile/createPlayerProfileScreen.dart';
import 'package:bottle_ver2/screens/teamDetailsScreenLayout.dart';
import 'package:bottle_ver2/screens/temp.dart';
import 'package:bottle_ver2/screens/tournament/createTournamentScreen.dart';
import 'package:bottle_ver2/screens/tournamentDetailsScreen.dart';
import 'package:bottle_ver2/screens/tournamentDetailsScreenLayout.dart';
import 'package:bottle_ver2/screens/tournamentsScreen.dart';
import 'package:bottle_ver2/screens/tournamentsScreenLayout.dart';
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
          // userProvider.getAllUsersStream();
          // if (authUser != null) userProvider.setLoggedInUser(authUser!.email!);
          return userProvider;
        }),
        ChangeNotifierProvider<PlayerProvider>(create: (_) => PlayerProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: customTheme,
        home: PlayerProfileForm(),
      ),
    );
  }
}
