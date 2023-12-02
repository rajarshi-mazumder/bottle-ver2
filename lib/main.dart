import 'package:bottle_ver2/authentication/login.dart';
import 'package:bottle_ver2/models/tournamentModels/playerProvider.dart';
import 'package:bottle_ver2/providers/userProvider.dart';
import 'package:bottle_ver2/screens/gameProfileMobileScreen.dart';
import 'package:bottle_ver2/screens/gameProfileMobileScreenLayout.dart';
import 'package:bottle_ver2/screens/gameProfileWebScreenLayout.dart';
import 'package:bottle_ver2/screens/playerProfile/createPlayerProfileScreen.dart';
import 'package:bottle_ver2/screens/teamDetailsScreenLayout.dart';
import 'package:bottle_ver2/screens/temp.dart';
import 'package:bottle_ver2/tournamentFlow/controllers/data/participantsData.dart';
import 'package:bottle_ver2/tournamentFlow/controllers/providers/doubleBracketTournamentDataProvider.dart';
import 'package:bottle_ver2/tournamentFlow/views/createTournament_doubleElim.dart';
import 'package:bottle_ver2/screens/tournamentDetailsScreen.dart';
import 'package:bottle_ver2/screens/tournamentDetailsScreenLayout.dart';
import 'package:bottle_ver2/screens/tournamentsScreen.dart';
import 'package:bottle_ver2/screens/tournamentsScreenLayout.dart';
import 'package:bottle_ver2/themes/platformSpecificOperations/platformCheck.dart';
import 'package:bottle_ver2/themes/themes.dart';
import 'package:bottle_ver2/tournamentOperations/tournamentScreenWidgets/doubleElimTournamentUtilities/winnerLoserRoundHashMap.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'dbOperations/dbManager.dart';
import 'doubleElimTournamentScreen.dart';
import 'firebase_options.dart';
import 'package:flutter/gestures.dart';

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
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: customTheme,
        // home: PlayerProfileForm(),
        home: DoubleElimTournamentScreen(
          participantsLength: 16,

          winnerLoserHashMap: winnerLoserRoundHashMap_16_teams,
          winnersBracketMap: winnersBracketMap_16_participants,
          losersBracketMap: losersBracketMap_16_participants,
        ),
        // home: MediaQuery.of(context).size.width > SCREEN_COLLAPSE_WIDTH
        //     ? GameProfileWebScreenLayout()
        //     : GameProfileMobileScreenLayout(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
