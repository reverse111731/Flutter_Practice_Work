import 'package:flutter/material.dart';
import 'package:random_name/presentation/screens/index.dart';

class AppRouter {
  Route? generateRoute(RouteSettings screens) {
    // For Global state, to pass state from 1 screen to the next
    // final GlobalKey<ScaffoldState>? key = screens.arguments as GlobalKey<ScaffoldState>?;
    switch (screens.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SelectionPage(
            title: "Selection Page",
          ),
        );
      case '/exchange':
        return MaterialPageRoute(
          builder: (_) => const RandomName(
            title: "Name",
          ),
        );
    }
  }
}

    // switch (screens.name) {
    //   case '/':
    //     return MaterialPageRoute(
    //       builder: (_) => Selection(
    //         title: "Selection Page",
    //       ),
    //     );
    //   case '/exchange':
    //     return MaterialPageRoute(
    //       builder: (_) => MyExchange(
    //         title: "Exchange Screen",
    //         //SelectionScreenKey: key,
    //       ),
    //     );
    //   case '/raffle':
    //     return MaterialPageRoute(
    //       builder: (_) => MyRaffle(
    //         title: "Raffle Screen",
    //         //SelectionScreenKey: key,
    //       ),
    //     );
    // }
