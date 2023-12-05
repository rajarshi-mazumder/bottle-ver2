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
import 'package:bottle_ver2/tournamentFlow/controllers/data/tournamentDatabase.dart';
import 'package:bottle_ver2/tournamentFlow/controllers/providers/doubleBracketTournamentDataProvider.dart';
import 'package:bottle_ver2/tournamentFlow/models/doubleElimTournament.dart';
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
import 'tournamentFlow/views/doubleElimTournamentScreen.dart';
import 'firebase_options.dart';
import 'package:flutter/gestures.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appDocumentDir = await getApplicationDocumentsDirectory();
  // Hive.initFlutter(appDocumentDir.path);
  await Hive.initFlutter();
  Hive.registerAdapter(DoubleElimTournamentHiveAdapter());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserProvider userProvider = UserProvider();
  int tournamentId = 10;

  Future<DoubleElimTournament_Hive> getTournamnet() async {
    late DoubleElimTournament_Hive tournament;
    try {
      tournament =
          await TournamentDatabase().getTournamentById(id: tournamentId);
    } catch (e) {
      List<String> participants = teamsWithImages.keys.toList();

      tournament = DoubleElimTournament_Hive(
          participants: participants,
          participantType: "Teams",
          tournamentData: template_8_participants,
          id: tournamentId);
    }

    return tournament;
  }

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
        home: FutureBuilder<DoubleElimTournament_Hive>(
          future: getTournamnet(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DoubleElimTournamentScreen(
                winnerLoserHashMap: winnerLoserRoundHashMap_8_teams,
                template: template_8_participants,
                doubleElimTournament_Hive: snapshot.data!,
              );
            } else
              return Center(
                child: Container(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              );
          },
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
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
